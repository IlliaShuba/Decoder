import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPage createState() => _UserInfoPage();
}

class _UserInfoPage extends State<UserInfoPage> {
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
                          VRouter.of(context).to('/chat-page');
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
                      IconButton(
                        onPressed: () {
                          print('share');
                        },
                        
                        padding: EdgeInsets.only( left: 210),
                        icon: Image.asset(
                          'assets/icon/imgsettings.png',
                          width: 20 * fem,
                          height: 20 * fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: ListView(physics: ClampingScrollPhysics(), children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 15 * fem, 0 * fem, 15 * fem),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icon/user-avatar.png',
                          width: 100 * fem,
                          height: 100 * fem,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                          'User',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2175 * ffem / fem,
                            color: Color(0xff191919),
                          ),
                        ),
                        )
                      ],
                    )),
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
                          child: Text(
                        'Безпека',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2175 * ffem / fem,
                          color: Color(0xff278664),
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'Повідомлення тут захищені наскрізним шифруванням',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xb279a471),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 15, bottom: 10),
                          child: Text(
                            'Ваші повідомлення захищені замками, тож лище ви та отримувачі мають унікальні ключі для їхнього відмикання.',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2175 * ffem / fem,
                              color: Color(0xb279a471),
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.fromLTRB(
                          25 * fem, 15 * fem, 0 * fem, 15 * fem),
                      width: 220 * fem,
                      child: Text(
                        'Ніколи не надсилати зашифровані повідомлення на неперевірені сеанси в цій кімнаті',
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
                      margin: EdgeInsets.only(left: 70),
                      child: Switch(
                        activeTrackColor: Color(0xff278664),
                        thumbColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return const Color.fromARGB(255, 255, 255, 255);
                        }),
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    )
                  ],
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
                          child: Text(
                        'Більше',
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
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Wrap(
                    children: [
                      GestureDetector(
                          onTap: () {
                            VRouter.of(context).to('/user-settings');
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            margin: EdgeInsets.only(top: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset(
                                      'assets/icon/imgsettings.png',
                                      width: 20 * fem,
                                      height: 20 * fem),
                                ),
                                Text(
                                  'Налаштування',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            VRouter.of(context).to('/user-notification');
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset('assets/icon/imgsettings.png',
                                      width: 20 * fem, height: 20 * fem),
                                ),
                                Text(
                                  'Сповіщення',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset('assets/icon/imgsettings.png',
                                      width: 20 * fem, height: 20 * fem),
                                ),
                                Text(
                                  '2 особи',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset(
                                      'assets/icon/imgsettings.png',
                                      width: 20 * fem,
                                      height: 20 * fem),
                                ),
                                Text(
                                  'Історія опитувань',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset(
                                      'assets/icon/imgsettings.png',
                                      width: 20 * fem,
                                      height: 20 * fem),
                                ),
                                Text(
                                  'Завантаження',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset('assets/icon/imgsettings.png',
                                      width: 20 * fem, height: 20 * fem),
                                ),
                                Text(
                                  'Додати ярлик на головний екран',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color(0xff278664),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                24 * fem, 15 * fem, 0 * fem, 15 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 20 * fem, 0 * fem),
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset(
                                      'assets/icon/imgsettings.png',
                                      width: 20 * fem,
                                      height: 20 * fem),
                                ),
                                Text(
                                  'Вийти',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2175 * ffem / fem,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
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
                          child: Text(
                        'Розширені',
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
                GestureDetector(
                    onTap: () {
                      print("Адреси кімнат");
                    },
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              25 * fem, 10 * fem, 20 * fem, 0 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Адреси кімнат',
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
                                    'Переглядайте й керуйте адресами цієї кімнати та їхньою видимістю в каталозі кімнат.',
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
                      print("Дозволи кімнати");
                    },
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              25 * fem, 15 * fem, 20 * fem, 15 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Дозволи кімнати',
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
                                    'Перегляд та оновлення ролей, необхідних для зміни різних частин кімнати.',
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
            )));
  }
}
