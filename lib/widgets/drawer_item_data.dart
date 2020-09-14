import 'dart:math';

import 'package:edifyin/providers/display_data.dart';
import 'package:edifyin/widgets/drawer_item_list_expanded.dart';

import '../models/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItemData extends StatefulWidget {
  final DisplayData orgData;
  final int i;

  DrawerItemData(this.orgData, this.i);
  @override
  _DrawerItemDataState createState() => _DrawerItemDataState();
}

class _DrawerItemDataState extends State<DrawerItemData> {
  var _expanded = false;



  @override
  Widget build(BuildContext context) {
    final data = widget.orgData.displayData.where(
            (org) =>
        org.iv == true);
    void _tapped() {
      setState(() {
        _expanded = !_expanded;
      });
    }

    var cnName = widget.orgData.displayData.where(
            (org) =>
        org.iv == true)
        .where(
            (visibleItem) =>
        visibleItem.ct ==
            'Plugin').toList()[widget.i].cn;
    return
      SingleChildScrollView(
        child: Container(
        // color: Colors.white,

        // padding: EdgeInsets.only(
        //     right: 4),
        child:
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(8),
              // margin: EdgeInsets.all(8),
              //             // padding: EdgeInsets.only(
              //             //     right: 4),

              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: <Widget>[
                  Container(
                    color: Colors.red[800],
                    height: MediaQuery.of(context).size.height * 0.064,
                    child: CircleAvatar(
                      child: Icon(
                          Icons.whatshot, ),
                      backgroundColor: Colors
                          .red[900],
                    ),
                  ),

                  // if(orgData.displayData.where(
                  //         (org) => org.iv == true).where(
                  //         (visibleItem) => visibleItem.ct == 'Plugin').where(
                  //         (element) => element.p.displayText != null).toList()[i].p.displayText)
                  Text(
                    widget.orgData.displayData.where(
                            (org) =>
                        org.iv == true)
                        .where(
                            (visibleItem) =>
                        visibleItem.ct ==
                            'Plugin')
                        .where(
                            (element) =>
                        element.p.displayText !=
                            null)
                        .toList()[widget.i]
                        .p
                        .displayText,
                    //   orgData.displayData.where(
                    //           (org) =>
                    //       org.iv == true)
                    //       .where(
                    //           (visibleItem) =>
                    //       visibleItem.ct ==
                    //           'List')
                    //       .where(
                    //           (element) =>
                    //       element.p.displayText !=
                    //           null)
                    //       .toList()[i]
                    //       .p
                    //       .displayText,
                    //   textAlign: TextAlign.start,
                  ),
                  IconButton(
                    icon: Icon(
                      _expanded ? Icons.keyboard_arrow_down
                          : Icons.arrow_forward_ios,
                      size: _expanded ? 20 : 12,
                    ),
                    onPressed: () {
                      _tapped();
                    },
                  ),



    //           ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: widget.orgData.displayData.where(
    //                     (org) =>
    //                 org.iv == true)
    //                 .where(
    //                     (visibleItem) =>
    //                 visibleItem.ct ==
    //                     'Manager')
    //                 .where(
    //                     (element) =>
    //                 element.pcn == _cnName)
    //                 .toList().length,
    //               itemBuilder: (ctx, index) => Container(
    //                   color: Colors.white,
    //                   margin: EdgeInsets.all(8),
    //                   padding: EdgeInsets.only(
    //                         right: 4),
    //                   child: Row(
    //                   mainAxisAlignment: MainAxisAlignment
    //                     .spaceBetween,
    //                   children: <Widget>[
    //                   Text(
    //                   widget.orgData.displayData.where(
    //                       (org) =>
    //               org.iv == true)
    //               .where(
    //                   (visibleItem) =>
    //               visibleItem.ct ==
    //                   'Manager')
    //               .where(
    //                   (element) =>
    //               element.pcn == _cnName).toList()[index]
    //                   .p
    //                   .displayText,
    //             ),
    //           ]
    //                   )
    // )),

                  //   child: ListView(
                  //       children: widget.orgData.displayData.where(
                  //               (org) =>
                  //           org.iv == true)
                  //           .where(
                  //               (visibleItem) =>
                  //           visibleItem.ct ==
                  //               'Manager')
                  //           .where(
                  //               (element) =>
                  //           element.pcn == _cnName)
                  //           .toList().map((manager) => Container(
                  //               color: Colors.white,
                  //               margin: EdgeInsets.all(8),
                  //               padding: EdgeInsets.only(
                  //                     right: 4),
                  //               child: Row(
                  //               mainAxisAlignment: MainAxisAlignment
                  //                 .spaceBetween,
                  //               children: <Widget>[
                  //               Text(
                  //               widget.orgData.displayData.where(
                  //                   (org) =>
                  //           org.iv == true)
                  //           .where(
                  //               (visibleItem) =>
                  //           visibleItem.ct ==
                  //               'Manager')
                  //           .where(
                  //               (element) =>
                  //           element.pcn == _cnName).toList()[widget.i]
                  //               .p
                  //               .displayText,
                  //         ),
                  //       ])
                  // )).toList(),
                  // ),
                ],
              ),
            ),
            // Divider(),
            SingleChildScrollView(
              child: AnimatedContainer(
                color: Colors.white,
                // width: MediaQuery.of(context).size.width * 0.9,
                duration: Duration(milliseconds: 150),
                margin: EdgeInsets.only(left: 48, right: 8),
                height: _expanded ? min(
                    data.where(
                            (visibleItem) =>
                        visibleItem.ct ==
                            'Manager')
                        .where(
                            (element) =>
                        element.pcn == cnName)
                        .toList().length * 9.0 +110, 110) : 0,
                child: Container(
                    // alignment: Alignment.centerRight,
                    child: DrawerItemListExpanded(widget.orgData, cnName))
              ),
            )
          ],
        ),
    ),
      );
  }
}
