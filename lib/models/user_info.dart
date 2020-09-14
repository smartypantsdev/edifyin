import 'package:flutter/cupertino.dart';

class Role {
  final int id;
  final String text;

  Role(
      this.id,
      this.text
      );
}


class UserInfo {
  final String name;
  final String username;
  final Role role;
  final String fguid;
  final String theme;

  UserInfo({
   @required this.name,
   @required this.username,
   @required this.role,
   @required this.fguid,
   this.theme
});
}