import 'dart:math';
import '../screens/list_screen.dart';
import 'package:edifyin/providers/display_data.dart';
import 'package:flutter/material.dart';

class DrawerItemListExpanded extends StatefulWidget {
  final DisplayData orgData;
  final String cnName;

  DrawerItemListExpanded(this.orgData, this.cnName);

  @override
  _DrawerItemListExpandedState createState() => _DrawerItemListExpandedState();
}

class _DrawerItemListExpandedState extends State<DrawerItemListExpanded> {
  var _expanded = false;


  @override
  Widget build(BuildContext context) {
    var _cnNameManager = widget.orgData.displayData
        .where((org) => org.iv == true)
        .where((visibleItem) => visibleItem.ct == 'Manager')
        .where((element) => element.pcn == widget.cnName)
        .toList()[0]
        .cn;
    final listTextOption = widget.orgData.displayData
        .where((org) => org.iv == true)
        .where((visibleItem) => visibleItem.ct == 'List')
        .where((element) => element.pcn == _cnNameManager);

    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,),
            width: MediaQuery.of(context).size.width * 0.59,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.005,
                ),
                Text(widget.orgData.displayData
                    .where((org) => org.iv == true)
                    .where((visibleItem) => visibleItem.ct == 'Manager')
                    .where((element) => element.pcn == widget.cnName)
                    .toList()[0]
                    .p
                    .displayText),
                IconButton(
                  icon: Icon(
                    _expanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: _expanded ? 20 : 12,
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ],
            ),
          ),
          AnimatedContainer(alignment: Alignment.centerRight,
              duration: Duration(milliseconds: 300),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              height: _expanded
                  ? min(
                      widget.orgData.displayData
                                  .where((org) => org.iv == true)
                                  .where(
                                      (visibleItem) => visibleItem.ct == 'List')
                                  .where(
                                      (element) => element.pcn == _cnNameManager)
                                  .toList()
                                  .length *
                              8.0 +
                          200,
                      200)
                  : 0,
              child: ListView.builder(
                itemCount: widget.orgData.displayData
                    .where((org) => org.iv == true)
                    .where(
                        (visibleItem) => visibleItem.ct == 'List')
                    .where(
                        (element) => element.pcn == _cnNameManager)
                    .toList()
                    .length,
                itemBuilder: (ctx, index) => Container(
                  alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                        listTextOption
                                        .toList()[index]
                                        .p
                                        .displayText
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ListScreen.routeName,
                                      arguments: listTextOption
                                          .toList()[0]
                                          .p
                                          .displayText
                                  );
                                },
                              ),
                              // IconButton(
                              //   icon: Icon(
                              //     _expanded
                              //         ? Icons.keyboard_arrow_down
                              //         : Icons.arrow_forward_ios,
                              //     size: _expanded ? 20 : 12,
                              //   ),
                              //   onPressed: () {
                              //     Navigator.of(context).pushNamed(
                              //       ListScreen.routeName,
                              //       arguments: widget.orgData.displayData
                              //           .where((org) => org.iv == true)
                              //           .where((visibleItem) => visibleItem.ct == 'List')
                              //           .where((element) => element.pcn == _cnNameManager)
                              //           .toList()[0]
                              //           .p
                              //           .displayText
                              //     );
                              //   },
                              // ),
                            ]
                        ),
                      ],
                    )
                ),
              )
          )
        ],
      ),
    );
  }
}
