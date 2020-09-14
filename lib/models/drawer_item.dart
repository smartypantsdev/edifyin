import 'package:flutter/cupertino.dart';

class Properties {
  final String displayText;
  final String fontAwesome;
  final String url;
  final String iconClass;
  final String editController;
  final String templateUrl;
  final String dashboardWidgets;



  Properties({
    this.displayText,
    this.fontAwesome,
    this.url,
    this.iconClass,
    this.editController,
    this.templateUrl,
    this.dashboardWidgets
});
}

class DrawerItem {
  final String cn;
  final String pcn;
  final bool iv;
  final ct;
  final Properties p;

  DrawerItem({
   @required this.cn,
   @required this.pcn,
   @required this.iv,
   @required this.ct,
   this.p
});
}