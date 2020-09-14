import '../models/organisation_item.dart';
import '../models/user_info.dart';
import '../providers/auth.dart';
import '../providers/display_data.dart';
import '../widgets/drawer_item_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/org_data.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // final String orgCode = ModalRoute.of(context).settings.arguments;
    final UserInfo loadedUser =
        Provider.of<DisplayData>(context).userInfo;

    // final loadedOrganisation = loadedOrg
    //     .firstWhere((organisation) =>
    // organisation.organisationCode == orgCode);
    final accessToken = Provider
        .of<Auth>(context)
        .token;


    // ModalRoute.of(context).settings.arguments as
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: Provider.of<DisplayData>(context)
                      .fetchDrawerData(accessToken),
                  builder: (ctx, dataSnapshot) {
                    if (dataSnapshot.connectionState ==
                            ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (dataSnapshot.error != null) {
                      // ...
                      // Do error handling stuff
                      return Center(
                        child: Text('An error occurred!'),
                      );
                      } else {
                        return Consumer<DisplayData>(
                          builder: (ctx, orgData, child) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                      height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.12,
                                  child: Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                      child: Icon(Icons.verified_user),
                                      ),
                                      title: Text(
                                        orgData.userInfo.name,
                                        textAlign: TextAlign.start,
                                      ),
                                      subtitle: Text
                                        ('Logged in as ${orgData.userInfo.role.text}'),
                                    ),
                                  ),
                          ),
                            Column(
                            children: <Widget>[
                            Container(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                            children: <Widget>[
                            Icon(
                            Icons.home,
                            color: Colors.white,
                            ),
                            SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.02,
                            ),
                            Text(
                            orgData.displayData.where(
                            (org) =>
                            org.iv == true)
                                .where(
                            (visibleItem) =>
                            visibleItem.ct ==
                            'Dashboard')
                                .where(
                            (element) =>
                            element.p.displayText !=
                            null)
                                .toList()[0]
                                .p
                                .displayText,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                            ),
                            ],
                            ),
                            ),
                            SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01,
                            ),
                            SingleChildScrollView(
                            child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                            orgData.displayData
                                .where(
                            (org) => org.iv == true)
                                .where(
                            (visibleItem) =>
                            visibleItem.ct == 'Plugin')
                                .length,
                            // orgData.displayData
                            //     .where(
                            //         (org) => org.iv == true)
                            //     .where(
                            //         (visibleItem) =>
                            //     visibleItem.ct == 'List')
                            //     .length,
                            itemBuilder: (ctx, i) =>
                            DrawerItemData(
                            orgData,
                            i
                            )
                            ),
                            ),
                            ],
                            ),
                              ],
                            );
                          }
                    );
                      }
                    }
                    }),
                //     SizedBox(
                //     height: MediaQuery
                //         .of
                //     }(context)
                //       .size
                //       .height * 0.01,
                // ),
                // Container(
                //     child: FutureBuilder(
                //         future: Provider.of<DisplayData>(context, listen: false)
                //             .fetchDrawerData(accessToken),
                //         builder: (ctx, dataSnapshot) {
                //           if (dataSnapshot.connectionState ==
                //               ConnectionState.waiting) {
                //             return Center(child: CircularProgressIndicator());
                //           } else {
                //             if (dataSnapshot.error != null) {
                //               // ...
                //               // Do error handling stuff
                //               return Center(
                //                 child: Text('An error occurred!'),
                //               );
                //             } else {
                //               return Consumer<DisplayData>(
                //                   builder: (ctx, orgData, child) {
                //                     return Column(
                //                       children: <Widget>[
                //                         Container(
                //                           padding: EdgeInsets.only(left: 12),
                //                           child: Row(
                //                             children: <Widget>[
                //                               Icon(
                //                                 Icons.home,
                //                                 color: Colors.white,
                //                               ),
                //                               SizedBox(
                //                                 width: MediaQuery
                //                                     .of(context)
                //                                     .size
                //                                     .width * 0.02,
                //                               ),
                //                               Text(
                //                                 orgData.displayData.where(
                //                                         (org) =>
                //                                     org.iv == true)
                //                                     .where(
                //                                         (visibleItem) =>
                //                                     visibleItem.ct ==
                //                                         'Dashboard')
                //                                     .where(
                //                                         (element) =>
                //                                     element.p.displayText !=
                //                                         null)
                //                                     .toList()[0]
                //                                     .p
                //                                     .displayText,
                //                                 style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Colors.white,
                //                                     fontSize: 20),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           height: MediaQuery
                //                               .of(context)
                //                               .size
                //                               .height * 0.01,
                //                         ),
                //                         SingleChildScrollView(
                //                           child: ListView.builder(
                //                             shrinkWrap: true,
                //                             itemCount:
                //                             orgData.displayData
                //                                 .where(
                //                                     (org) => org.iv == true)
                //                                 .where(
                //                                     (visibleItem) =>
                //                                 visibleItem.ct == 'Plugin')
                //                                 .length,
                //                             // orgData.displayData
                //                             //     .where(
                //                             //         (org) => org.iv == true)
                //                             //     .where(
                //                             //         (visibleItem) =>
                //                             //     visibleItem.ct == 'List')
                //                             //     .length,
                //                             itemBuilder: (ctx, i) =>
                //                                 DrawerItemData(
                //                                   orgData,
                //                                   i
                //                                 )
                //                           ),
                //                         ),
                //                       ],
                //                     );
                //                   }
                //               );
                //             }
                //           }
                //         }
                //     )
                // )

                //     Container(
                //       child: ListView(
                //           children: <Widget>[
                //       ListTile(
                //       leading: CircleAvatar(
                //           child: Icon(Icons.verified_user),
                //     ),
                //     title: Text('name',
                //       textAlign: TextAlign.start,),
                //     subtitle: Text('Logged in as Student'),
                // )],
                // ),
                // )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // child: Text(orgCode),
          ),
        ],
      ),
    );
  }
}
