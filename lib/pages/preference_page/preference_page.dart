import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePage createState() => _PreferencePage();
}

class _PreferencePage extends State<PreferencePage> {
  bool isMessagesSwitched = false;
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SettingsPage()));
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
                        'Вподабання',
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
                          'Інтерфейс користувача',
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
                        onTap: () {print("Мова");},
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
                                    'Мова',
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
                                    'українська (Україна)',
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
                    GestureDetector(
                    onTap: () {print("Тема");},
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
                                  'Тема',
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
                                  'Системна',
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
                    GestureDetector(
                    onTap: () {print("Розмір шрифту");},
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
                                  'Розмір шрифту',
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
                                  'Звичайний',
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            child: Text(
                              'Надсилати сповіщення про набір повідомлення',
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
                              'Дозволити іншим користувачам бачити, що ви набираєте повідомлення.',
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
                              
                              
                            value: isMessagesSwitched,
                            onChanged: (value) {
                              setState(() {
                                isMessagesSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Надсилати повідомлення натисканням Enter',
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
                              'Натисканням Enter на програмній клавіатурі надсилатиме повідомлення замість перенесення рядка',
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
                          margin: EdgeInsets.only(left: 60, top: 40),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isEnterSwitched,
                            onChanged: (value) {
                              setState(() {
                                isEnterSwitched = value; 
                              });
                            },
                              
                              
                          ),
                          
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показати клавіатуру емоджі',
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
                              'Додати кнопку до редактора повідомлень, щоб відкрити клавіатуру емоджі',
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
                          margin: EdgeInsets.only(left: 60, top: 40),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isEmojiSwitched,
                            onChanged: (value) {
                              setState(() {
                                isEmojiSwitched = value; 
                              });
                            },
                              
                              
                          ),
                          
                        )
                    ]
                  ),
                  GestureDetector(
                    onTap: () {print("Зняти світлину чи відео");},
                    child: Container(
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
                                  'Зняти світлину чи відео',
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
                                  'Завжди запитувати',
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
                  ),
                ],
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
                            'Стрічка подій',
                            style: SafeGoogleFont (
                              'Montserrat',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2175*ffem/fem,
                              color: Color(0xff278664),
                            ),
                          )
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 200*fem,
                              child: Text(
                                'Показувати повідомлення у бульбашках',
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
                              margin: EdgeInsets.only(left: 60, top: 30),
                              child: Switch(
                                activeTrackColor: Color(0xff278664),
                                thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  return const Color.fromARGB(255, 255, 255, 255);
                                }),
                              
                                value: isMessageBubbleSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isMessageBubbleSwitched = value; 
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200*fem,
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Показувати найновіші дані користувача',
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
                              'Натисканням Enter на програмній клавіатурі надсилатиме повідомлення замість перенесення рядка',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isNewMessagesSwitched,
                            onChanged: (value) {
                              setState(() {
                                isNewMessagesSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Попередній перегляд посилань',
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
                              'Попередній перегляд посилань у бесіді, якщо ваш сервер пітримує цю можливість.',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isPreviousShownSwitched,
                            onChanged: (value) {
                              setState(() {
                                isPreviousShownSwitched = value; 
                              });
                            }, 
                          ),
                        )
                    ]
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 200*fem,
                        child: Text(
                          'Показувати час надсилання для всіх повідомлень',
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
                        margin: EdgeInsets.only(left: 60, top: 30),
                        child: Switch(
                          activeTrackColor: Color(0xff278664),
                          thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            return const Color.fromARGB(255, 255, 255, 255);
                          }),
                              
                          value: isTimeSwitched,
                          onChanged: (value) {
                            setState(() {
                              isTimeSwitched = value; 
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показувати підтверження прочитання',
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
                              'Натискайте мітки прочитання для детального переліку.',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isShowReadSwitched,
                            onChanged: (value) {
                              setState(() {
                                isShowReadSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показувати видалені повідомлення',
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
                              'Показувати заглушку на місці видалених повідомлень',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isShowDeletedSwitched,
                            onChanged: (value) {
                              setState(() {
                                isShowDeletedSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показувати події приєднання та виходу',
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
                              'Це не стосується запрошень, вилучень і блокувань.',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isEventsSwitched,
                            onChanged: (value) {
                              setState(() {
                                isEventsSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показувати події облікових записів',
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
                              'Містить зміни аватарів та імен.',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isShowChangesSwitched,
                            onChanged: (value) {
                              setState(() {
                                isShowChangesSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показувати ефекти бесіди',
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
                              'Скористайтеся командою /confetti або надсилайте повідомлення, що містить ❄️ або 🎉',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isShowEffectsSwitched,
                            onChanged: (value) {
                              setState(() {
                                isShowEffectsSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Автовідтворення анімованих зображень',
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
                              'Відтворювати анімовані зображення, як тільки вони стають видимі у стрічці',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isShowAnimatedSwitched,
                            onChanged: (value) {
                              setState(() {
                                isShowAnimatedSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Увімкнути пряме поширення',
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
                              'Показувати останні бесіди в системному меню загального доступу',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isSharingSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSharingSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  )
                ],
              )
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
                      'Каталог кімнат',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    )
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200*fem,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Показувати кімнати з делікатним вмістом',
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
                              'Показувати всі кімнати в каталозі кімнат, включно з кімнатами з делікатним вмістом.',
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
                          margin: EdgeInsets.only(left: 60, top: 30),
                          child: Switch(
                            activeTrackColor: Color(0xff278664),
                            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return const Color.fromARGB(255, 255, 255, 255);
                            }),
                              
                              
                            value: isCatalogSwitched,
                            onChanged: (value) {
                              setState(() {
                                isCatalogSwitched = value; 
                              });
                            },
                          ),
                        )
                    ],
                  )
                ],
              )
            )
            ]
          ),
        )
      )
    );
  }
}