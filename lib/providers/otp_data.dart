import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RegType {
  final int id;
  final String text;

  RegType({
    this.id,
    this.text
});
}

class ContactNumberType {
  final int id;
  final String text;

  ContactNumberType({
    this.id,
    this.text
});
}

class MobileNumber {
  final ContactNumberType contactNumberType;
  final int countryCode;
  final int contactNumber;

  MobileNumber({
      this.contactNumberType,
      this.countryCode,
      this.contactNumber}
      );
}


class Post {
  final String organisationCode;
  final RegType registrationType;
  final String code;
  final MobileNumber mobileNumber;

  Post({
    this.organisationCode,
    this.registrationType,
    this.code,
    this.mobileNumber
});
}

class RegResponse {
  final Post regResponse;

  RegResponse(this.regResponse);
}



class OtpData with ChangeNotifier{

  Future<void> fetchRegisterData() async{
    final url = 'https://api.edifyin.teamin.in/Open/Register';

    final response = await http.get(url);
    print(response.body);

}
}