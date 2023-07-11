import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class UserNotificationPage extends StatefulWidget {
  @override
  _UserNotificationPage createState() => _UserNotificationPage();
}

class _UserNotificationPage extends State<UserNotificationPage> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double baseHeight = 800;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double fvm = MediaQuery.of(context).size.height / baseHeight;
    double ffem = fem * 0.97;

    return Material(
        type: MaterialType.transparency,
        child: Container(
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leadingWidth: double.infinity,
                leading: Container(
                  padding: EdgeInsets.only(left: 22 * fem),
                  width: double.infinity,
                  height: 100 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          VRouter.of(context).to('/user-info');
                        },
                        padding: EdgeInsets.only(right: 13 * fem),
                        icon: Image.asset(
                          'assets/icon/backbutton-Vk8.png',
                          width: 20 * fem,
                          height: 20 * fem,
                        ),
                      ),
                      Image.asset(
                        'assets/icon/user-avatar.png',
                        width: 20 * fem,
                        height: 20 * fem,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            10 * fem, 0.5 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'User',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2175 * ffem / fem,
                            color: Color(0xff191919),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: ListView(physics: ClampingScrollPhysics(), children: [
                Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.fromLTRB(
                        25 * fem, 15 * fem, 0 * fem, 15 * fem),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(247, 244, 244, 1)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(247, 244, 244, 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                  'Сповіщати мене про',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ])),
                Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(247, 244, 244, 1)),
                    child: Column(
                      children: [
                        RadioListTile<int>(
                          title: const Text('Усі повідомлення'),
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile<int>(
                          title: const Text('Жодного'),
                          value: 2,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ],
                    ))
              ]),
            )));
  }
}
