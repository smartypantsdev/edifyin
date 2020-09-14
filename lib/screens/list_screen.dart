import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  static const routeName = 'list-screen';

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(

      ),
    );
  }
}
