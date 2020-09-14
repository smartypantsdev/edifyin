import '../widgets/org_intro_component.dart';

import '../providers/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../providers/org_data.dart';
import 'package:flutter/material.dart';

import './main_screen.dart';

class OrgIntro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _orgCodeController = TextEditingController();
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: mediaQuery.height * 0.1,),
          Container(
            child: new SvgPicture.asset(
              'assets/Image 1.svg',
              // width: MediaQuery.of(context).size.width ,
              alignment: Alignment.center,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.16,),
          OrgIntroComponent(),
          SizedBox(
            height: mediaQuery.height * 0.08,
          ),
          Text('Or', style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          ),
          // SizedBox(
          //   height: mediaQuery.height * 0.1,
          // ),
          // SvgPicture.asset(
          //   'assets/teamIN.svg',
          //   // width: MediaQuery.of(context).size.width ,
          // ),
        ],
      ),
    );
  }
}
