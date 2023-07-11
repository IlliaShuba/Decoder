import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class UserSettingsPage extends StatefulWidget {
  @override
  _UserSettingsPage createState() => _UserSettingsPage();
}

class _UserSettingsPage extends State<UserSettingsPage> {
  bool isSwitched = false;

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
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.fromLTRB(0 * fem, 15 * fem, 0 * fem, 15 * fem),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    'assets/icon/user-avatar.png',
                    width: 100 * fem,
                    height: 100 * fem,
                  ),
                ),
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
                                  'Налаштування',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(bottom: 15, top: 25, right: 25),
                            child: Column(children: [
                              Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Назва кімнати',
                                      filled: true,
                                      fillColor: Colors.white),
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 13 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Тема',
                                      filled: true,
                                      fillColor: Colors.white),
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 13 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                  ),
                                ),
                              )
                            ]),
                          )
                        ])),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 15 * fem, 0 * fem, 15 * fem),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(121, 164, 113, 0.7)),
                        top: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(121, 164, 113, 0.7),
                        )),
                  ),
                  child: Column(children: [
                    GestureDetector(
                        onTap: () {
                          print("Прочитність історії");
                        },
                        child: Column(children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Прочитність історії',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xff278664),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Лише учасники (з моменту вибору цієї опції)',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xb279a471),
                                        ),
                                      ),
                                    )
                                  ]))
                        ])),
                    GestureDetector(
                        onTap: () {
                          print("Доступ до кімнати");
                        },
                        child: Column(children: [
                          Container(
                              //margin: EdgeInsets.only(top: 25),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Доступ до кімнати',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xff278664),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Приватна',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xb279a471),
                                        ),
                                      ),
                                    )
                                  ]))
                        ])),
                  ]),
                )
              ]),
            )));
  }
}
