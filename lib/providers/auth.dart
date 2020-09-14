import 'package:edifyin/providers/display_data.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class RefreshToken {
  String refreshToken;
  DateTime refreshTokenExpiresIn;

}


class Auth with ChangeNotifier {
  String _accessToken;
  String _refreshToken;
  DateTime _expiresIn;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiresIn != null &&
        _expiresIn.isAfter(DateTime.now()) &&
        _accessToken != null) {
      return _accessToken;
    }
    return null;
  }

  String get refreshToken {
    return _refreshToken;
  }

  Future<void> authenticate(
      String username,
      String password) async {
    final url = 'https://api.edifyin.teamin.in/token';

    try{
      final tokenResponse = await http.post(url, body: {
        'username': '0007',
        'password': 'testing1',
        'grant_type': 'password',
        'scope': 'org:B0C5B70A-5273-4B3A-865E-8E172F699C5A',
        'client_id': 'android'
      });
      // print(tokenResponse.body);
      final responseData = json.decode(tokenResponse.body);
      if (responseData['error'] != null ) {
        throw HttpException(responseData['error']['message']);
      }
      _accessToken = responseData['access_token'];
      _refreshToken = responseData['refresh_token'];
      _expiresIn = DateTime.now()
          .add(Duration(seconds: responseData['expires_in']));
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
        'expiresIn': _expiresIn.toIso8601String(),
      });
      prefs.setString('userData', userData);
      // DisplayData().fetchDrawerData(_accessToken);
      
    } catch (error) {
      throw error;
    }
  }

  // Future<bool> tryAutoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('userData')) {
  //     return false;
  //   }
  //   final extractedData = json.decode(
  //       prefs.getString('userData')) as Map<String, Object>;
  //   final expiryDate = DateTime.parse(extractedData['expiryDate']);
  //
  //   if (expiryDate.isBefore(DateTime.now())) {
  //     return false;
  //   }
  //   _token = extractedData['tokenn'];
  //   _userId = extractedData['userId'];
  //   _expiryDate = expiryDate;
  //   _autoLogout();
  //   notifyListeners();
  //   return true;
  // }

  Future<void> logout() async{
    _accessToken = null;
    _expiresIn = null;
    if(_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if(_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiresIn.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
