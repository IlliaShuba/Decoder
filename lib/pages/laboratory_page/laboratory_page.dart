import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:vrouter/vrouter.dart';

class LaboratoryPage extends StatefulWidget {
  @override
  _LaboratoryPage createState() => _LaboratoryPage();
}

class _LaboratoryPage extends State<LaboratoryPage> {
  bool isFingerSwapSwitched = false;
  bool isKeysSpreadSwitched = false;
  bool isLaTexSwitched = false;
  bool isNotificationBranchSwitched =false;
  bool isErrorsAnaliticSwitched = false;
  bool isLocationSwitched = false;
  bool isCallSwitched = false;
  bool isEasierSwitched = false;
  bool isDelayedMessagesSwitched = false;
  bool isExpandedSwitched = false;
  bool isNewManegerSwitched = false;
  bool isClientInfoSwitched = false;
  bool isVoiceTranslationSwitched = false;

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
                        'Лабораторія',
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
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Це експериментальні можливості, що можуть несподівано виходити з ладу. Користуйтесь обережно.',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 13*ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.2175*ffem/fem,
                          color: Color(0xb279a471),
                        ),
                      ),
                    ),
                    Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 200*fem,
                        child: Text(
                          'Провести пальцем, щоб відповісти у стрічці подій',
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
                              
                          value: isFingerSwapSwitched,
                          onChanged: (value) {
                            setState(() {
                              isFingerSwapSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'MSC3061: Поширення ключів кімнати для минулих повідомлень',
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
                              'Коли запросити когось у зашифровану кімнату, яка поширює історію, зашифрована історія буде видимою.',
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
                              
                              
                            value: isKeysSpreadSwitched,
                            onChanged: (value) {
                              setState(() {
                                isKeysSpreadSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути підтримку LaTeX',
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
                              'Перезапустіть застосунок, щоб зміни набули чинності.',
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
                              
                              
                            value: isLaTexSwitched,
                            onChanged: (value) {
                              setState(() {
                                isLaTexSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути гілки повідомлень',
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
                              'Примітка: застосунок перезапуститься',
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
                              
                              
                            value: isNotificationBranchSwitched,
                            onChanged: (value) {
                              setState(() {
                                isNotificationBranchSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Автозвіт про помилки шифрування',
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
                              'Ваша система автоматично надсилатиме журнали, коли виникне помилка неможливості розшифрування',
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
                              
                              
                            value: isErrorsAnaliticSwitched,
                            onChanged: (value) {
                              setState(() {
                                isErrorsAnaliticSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути поширення місцеперебування наживо',
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
                              'Тимчасова реалізація: місця зберігаються в історії кімнат',
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
                              
                              
                            value: isLocationSwitched,
                            onChanged: (value) {
                              setState(() {
                                isLocationSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути ярлики дозволів на виклик елемента',
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
                              'Віджети автосхвалення викликів DeCoder і надання доступу до камери/мікрофона',
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
                              
                              
                            value: isCallSwitched,
                            onChanged: (value) {
                              setState(() {
                                isCallSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути новий вигляд',
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
                              'Спрощений DeCoder з опціональними вкладками',
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
                              
                              
                            value: isEasierSwitched,
                            onChanged: (value) {
                              setState(() {
                                isEasierSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути відкладені приватні повідомлення',
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
                              'Створюйте приватні повідомлення лише за надсилання першого повідомлення',
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
                              
                              
                            value: isDelayedMessagesSwitched,
                            onChanged: (value) {
                              setState(() {
                                isDelayedMessagesSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути розширений текстовий редактор',
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
                              'Спробуйте розширений текстовий редактор (незабаром з’явиться режим звичайного тексту)',
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
                              
                              
                            value: isExpandedSwitched,
                            onChanged: (value) {
                              setState(() {
                                isExpandedSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути новий менеджер сеансів',
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
                              'Отримайте кращу видимість і контроль над усіма вашими сеансами.',
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
                              
                              
                            value: isNewManegerSwitched,
                            onChanged: (value) {
                              setState(() {
                                isNewManegerSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути запис відомостей про клієнтів',
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
                              'Записуйте назву клієнта, версію та URL-адресу, щоб легше розпізнавати сеанси в менеджері сеансів.',
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
                              
                              
                            value: isClientInfoSwitched,
                            onChanged: (value) {
                              setState(() {
                                isClientInfoSwitched = value; 
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Увімкнути голосові трансляції',
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
                              'Можливість записувати та надсилати голосові трансляції до стрічки кімнати.',
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
                              
                              
                            value: isVoiceTranslationSwitched,
                            onChanged: (value) {
                              setState(() {
                                isVoiceTranslationSwitched = value; 
                              });
                            },
                          ),
                        )
                      ],
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