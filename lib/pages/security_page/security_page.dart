import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class SecurityPage extends StatefulWidget {
  @override
  _SecurityPage createState() => _SecurityPage();
}

class _SecurityPage extends State<SecurityPage> {
  bool isDecoderSwitched = false;

  bool isEnterSwitched = false;
  bool isEmojiSwitched = false;
  bool isMessageBubbleSwitched = false;
  bool isNewMessagesSwitched = false;
  bool isPreviousShownSwitched = false;
  bool isTimeSwitched = false;
  bool isEventsSwitched = false;
  bool isShowDeletedSwitched = false;
  bool isShowReadSwitched = false;
  bool isShowChangesSwitched = false;
  bool isShowEffectsSwitched = false;
  bool isShowAnimatedSwitched = false;
  bool isSharingSwitched = false;
  bool isCatalogSwitched = false;

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
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
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
                        VRouter.of(context).to('/settings');
                      },
                      padding: EdgeInsets.only(right: 13*fem),
                      icon:
                        Image.asset(
                          'assets/icon/backbutton-Vk8.png',
                          width: 20*fem,
                          height: 20*fem,
                        ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0.5*fem, 0*fem, 0*fem),
                      child: Text(
                        'Безпека',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2175*ffem/fem,
                          color: Color(0xff191919),
                        ),
                      ),
                    ),
                  ],
                
                ),
              ),
            ),
          body: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.fromLTRB(25*fem, 15*fem, 0*fem, 15*fem),
                decoration: BoxDecoration(
                  border: Border(bottom:  BorderSide(width: 1, color: Color.fromRGBO(121, 164, 113, 0.7)))
                ),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                          'Криптографія',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2175*ffem/fem,
                            color: Color(0xff278664),
                        ),
                      )
                    ),
                    GestureDetector(
                        onTap: () {print("Перехресне підписування");},
                        child: Column(
                          children: [
                            Container(
                            margin: EdgeInsets.only(top: 25),
                            width: double.infinity,
                            decoration: BoxDecoration (
                              color: Color.fromARGB(0, 255, 255, 255),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Перехресне підписування',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff278664),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Перехресне підписування не ввімкнене',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 13*ffem,
                                      fontWeight: FontWeight.w300,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xb279a471),
                                    ),
                                  ),
                                )
                              ]
                            )
                          )
                        ]
                      )
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'Загальнодоступна назва',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2175*ffem/fem,
                            color: Color(0xff278664),
                        ),
                      )
                    ),
                    Container(
                    child: Column(
                      
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'ID сеансу',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'JDJKFLGKGS',
                                  style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xb279a471),
                                  ),
                                ),
                              )
                            ]
                          )
                        )
                      ]
                    )
                  ),
                    Container(
                    child: Column(
                      
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Ключ сеансу',
                                  style: SafeGoogleFont (
                                    'Montserrat',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175*ffem/fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'u6sd lksd kln3 jnfs jlds kwrH lk3t ljrj A3jd fHkf jk23',
                                  style: SafeGoogleFont (
                                  'Montserrat',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2175*ffem/fem,
                                  color: Color(0xb279a471),
                                  ),
                                ),
                              )
                            ]
                          )
                        )
                      ]
                    )
                  ),
                    Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            width: 200*fem,
                            child: Text(
                              'Шифрувати лише для звірених сеансів',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175*ffem/fem,
                                color: Color(0xff278664),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 200*fem,
                            child: Text(
                              'Ніколи не надсилати зашифровані повідомлення з цього сеансу на незвірені',
                              style: SafeGoogleFont (
                                'Montserrat',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.2175*ffem/fem,
                                color: Color(0xb279a471),
                                ),
                              ),
                            )
                          ]
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isDecoderSwitched,
                            onChanged: (value) {
                              setState(() {
                                isDecoderSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  )
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.fromLTRB(25*fem, 15*fem, 0*fem, 15*fem),
                decoration: BoxDecoration(
                  border: Border(bottom:  BorderSide(width: 1, color: Color.fromRGBO(121, 164, 113, 0.7)))
                ),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                          'Активні сеанси',
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2175*ffem/fem,
                            color: Color(0xff278664),
                        ),
                      )
                    ),
                    GestureDetector(
                        onTap: () {print("Показати всі сеанси");},
                        child: Column(
                          children: [
                            Container(
                            margin: EdgeInsets.only(top: 25),
                            width: double.infinity,
                            decoration: BoxDecoration (
                              color: Color.fromARGB(0, 255, 255, 255),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Показати всі сеанси',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xff278664),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '2 активні сеанси',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 13*ffem,
                                      fontWeight: FontWeight.w300,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xb279a471),
                                    ),
                                  ),
                                )
                              ]
                            )
                          )
                        ]
                      )
                    ),
                  ]
                ),
              )
            ]
          ),
        )
      )
    );
  }
}