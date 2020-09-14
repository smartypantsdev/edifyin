import 'dart:convert';
import '../models/user_info.dart';

import 'package:edifyin/models/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DisplayData with ChangeNotifier{

  List<DrawerItem> _displayData = [];
  UserInfo _userInfo ;

  List<DrawerItem> get displayData {
    return [..._displayData];
  }

  UserInfo get userInfo {
    return _userInfo;
  }

  Future<void> fetchDrawerData(
      String _accessToken) async {
    //Fetching data to be displayed in drawer
    final urlToken3 = 'https://api.edifyin.teamin.in/Common/Context/Controllers';

    try {
      final tokenResponse3 = await http.get(urlToken3, headers: {
        'Authorization': 'Bearer $_accessToken'
      }
      );
      final loadedData = [];
      // print(tokenResponse3.body);
      final responseData = json.decode(tokenResponse3.body) as List;
      responseData.forEach((data) {

        final dataExtracted = (data as Map<String, dynamic>);
        // print(dataExtracted['p']['DisplayText']);
        loadedData.add(DrawerItem(
            cn: dataExtracted['cn'],
            pcn: dataExtracted['pcn'],
            iv: dataExtracted['iv'],
            ct: dataExtracted['ct'],
            p: Properties(
              displayText: dataExtracted['p']['DisplayText'],
              fontAwesome: dataExtracted['p']['FontAwesome'],
              dashboardWidgets: dataExtracted['p']['DashboardWidgets'],
              url: dataExtracted['p']['URL'],
              editController: dataExtracted['p']['EditController'],
              iconClass: dataExtracted['p']['IconClass'],
              templateUrl: dataExtracted['p']['TemplateURL']
            )
        )
        );
      });

      _displayData = loadedData.cast<DrawerItem>().toList();

      // notifyListeners();
    // loadedData.add(responseData.map((data) => print(data););
      // print(loadedData[0]);

      //Fetching user Info

      final urlUserInfo = 'https://api.edifyin.teamin.in/Common/Context/Defaults';

      final userInfoResponse = await http.get(urlUserInfo, headers: {
          'Authorization': 'Bearer $_accessToken'
        }
      );
      // print(userInfoResponse.body);
      final _loadedUserInfo = [];
      final loadedInfo = json.decode(userInfoResponse.body) ;

      _loadedUserInfo.add(UserInfo(
          name: loadedInfo['FriendlyName'],
          username: loadedInfo['Username'],
          role: Role(
              loadedInfo['Role']['Id'],
              loadedInfo['Role']['Text']
          ),
          fguid: loadedInfo['FGUID'],
          theme: loadedInfo['Theme']
      ));

      _userInfo = _loadedUserInfo[0];

      // print(loadedInfo['FriendlyName']);

      // print(_loadedData);



    } catch (error) {
      throw error;
    }
  }
}
