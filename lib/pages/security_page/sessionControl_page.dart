import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class SessionControlPage extends StatefulWidget {
  @override
  _SessionControlPage createState() => _SessionControlPage();
}

class _SessionControlPage extends State<SessionControlPage> {
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          VRouter.of(context).to('/security');
                        },
                        padding: EdgeInsets.only(right: 13 * fem),
                        icon: Image.asset(
                          'assets/icon/backbutton-Vk8.png',
                          width: 20 * fem,
                          height: 20 * fem,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0.5 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Керування сеансами',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
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
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(121, 164, 113, 0.7)))),
                    child: Text(
                      'Поточний сеанс',
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2175 * ffem / fem,
                        color: Color(0xff278664),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      print('click');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.fromLTRB(
                          25 * fem, 15 * fem, 0 * fem, 15 * fem),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(121, 164, 113, 0.7)))),
                      child: Container(
                          child: Column(children: [
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 255, 255, 255),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Ім\'я',
                                      style: SafeGoogleFont(
                                        'Montserrat',
                                        fontSize: 13 * ffem,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xb279a471),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'HLIDHILIDBPS',
                                      style: SafeGoogleFont(
                                        'Montserrat',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xff278664),
                                      ),
                                    ),
                                  )
                                ])),
                        Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                    child: Text(
                                      'ID',
                                      style: SafeGoogleFont(
                                        'Montserrat',
                                        fontSize: 13 * ffem,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xb279a471),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'HLIDHILIDBPS',
                                      style: SafeGoogleFont(
                                        'Montserrat',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xff278664),
                                      ),
                                    ),
                                  )
                                ]),
                            Container(
                              margin: EdgeInsets.only(left: 200, top: 35),
                              child: Image.asset(
                                'assets/icon/iconmonstr-shield-28.png',
                                width: 35 * fem,
                                height: 35 * fem,
                              ),
                            )
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 255, 255, 255),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Востаннє онлайн',
                                      style: SafeGoogleFont(
                                        'Montserrat',
                                        fontSize: 13 * ffem,
                                        fontWeight: FontWeight.w300,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xb279a471),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 25),
                                    child: Text(
                                      '109.223.30.213 @ Сьогодні 10:00',
                                      style: SafeGoogleFont(
                                        'Montserrat',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2175 * ffem / fem,
                                        color: Color(0xff278664),
                                      ),
                                    ),
                                  )
                                ]))
                      ])),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.fromLTRB(
                        25 * fem, 15 * fem, 0 * fem, 15 * fem),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(121, 164, 113, 0.7)))),
                    child: Text(
                      'Сеанси з інших пристроїв',
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2175 * ffem / fem,
                        color: Color(0xff278664),
                      ),
                    )),
                Container(
                  child: GestureDetector(
                      onTap: () {
                        print('click');
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.fromLTRB(
                            25 * fem, 15 * fem, 0 * fem, 15 * fem),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color:
                                        Color.fromRGBO(121, 164, 113, 0.7)))),
                        child: Container(
                            child: Column(children: [
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Ім\'я',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xb279a471),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'android',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xff278664),
                                        ),
                                      ),
                                    )
                                  ])),
                          Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 25),
                                      child: Text(
                                        'ID',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xb279a471),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'JKSFLSLSZKL',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xff278664),
                                        ),
                                      ),
                                    )
                                  ]),
                              Container(
                                margin: EdgeInsets.only(left: 200, top: 35),
                                child: Image.asset(
                                  'assets/icon/iconmonstr-shield-32.png',
                                  width: 35 * fem,
                                  height: 35 * fem,
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 25),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 255, 255, 255),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Востаннє онлайн',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xb279a471),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 25),
                                      child: Text(
                                        '45.211.1.23 @ -',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xff278664),
                                        ),
                                      ),
                                    )
                                  ]))
                        ])),
                      )),
                ),
              ]),
            )));
  }
}
