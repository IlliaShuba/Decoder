import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class CrossedConnectionPage extends StatefulWidget {
  @override
  _CrossedConnectionPage createState() => _CrossedConnectionPage();
}

class _CrossedConnectionPage extends State<CrossedConnectionPage> {
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
                          'Перехресне підписування',
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
                      10 * fem, 15 * fem, 0 * fem, 15 * fem),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                        'Перехресне підписування не ввімкнене',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2175 * ffem / fem,
                          color: Color(0xff278664),
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: ElevatedButton(
                          child: Text("Ініціалізувати перехресне підписування",
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2175 * ffem / fem,
                                color: Color.fromARGB(255, 255, 255, 255),
                              )),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color.fromRGBO(39, 134, 100, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          onPressed: () {
                            print('click');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}
