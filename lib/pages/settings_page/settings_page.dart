import 'package:decoder/pages/chat_list/chat_list_view.dart';
import 'package:decoder/pages/home/homeserver_picker.dart';
import 'package:decoder/pages/home/homeserver_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:decoder/pages/preference_page/preference_page.dart';
import 'package:vrouter/vrouter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPage createState() => _SettingsPage();
}


class _SettingsPage extends State<SettingsPage> {

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
      width: double.infinity,
      
      child: Container(

        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 150*fem),
        width: double.infinity,

        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),

        child: Wrap(
          children: [
            AppBar(
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
                        VRouter.of(context).to('/rooms');
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
                        'Налаштування',
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

            GestureDetector(
              onTap: () {
                
                },
                child:  Container(
                  padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                  margin: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  decoration: BoxDecoration (
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                        width: 20*fem,
                        height: 20*fem,
                        child: Image.asset(
                          'assets/icon/imgsettings.png',
                          width: 20*fem,
                          height: 20*fem
                        ),
                      ),
                     
                      Text(
                        'Загальні',
                        style: SafeGoogleFont (
                          'Montserrat',
                          fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                VRouter.of(context).to('/notification');
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgbell.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Сповіщення',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                VRouter.of(context).to('/preference');
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgbut.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Вподобання',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                VRouter.of(context).to('/voice-and-video');
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgvideocall.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Голос і відео',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                VRouter.of(context).to('/security');
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgsecurity.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Безпека',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                VRouter.of(context).to('/laboratory');
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgflag.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Лабораторія',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgthreedots.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Додаткові налаштування',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatListView()));
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imghelp.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Допомога та інформація',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeserverPicker()));
              }, 
              child:  Container(
                padding: EdgeInsets.fromLTRB(24*fem, 15*fem, 0*fem, 15*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/icon/imgblank.png',
                        width: 20*fem,
                        height: 20*fem
                      ),
                    ),
                    Text(
                      'Правові положення',
                      style: SafeGoogleFont (
                        'Montserrat',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2175*ffem/fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    )
    );
  }
}