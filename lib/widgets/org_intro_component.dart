import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/main_screen.dart';

class OrgIntroComponent extends StatelessWidget {
  final _orgCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        // width: mediaQuery.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height * 0.08,
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: _orgCodeController,
                  decoration: InputDecoration(
                    labelText: 'Organisation code',
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                // backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red[900],
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,),
                    onPressed: () {
                      // DataGetter().fetchGUID(
                      //     _orgCodeController.text);
                      Provider.of<Auth>(context, listen: false)
                          .authenticate('0007', 'testing1');
                      Navigator.of(context).pushReplacementNamed(
                          MainScreen.routeName
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
