import 'dart:io';

import 'package:flutter/material.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:intl/intl.dart';
import 'package:decoder/pages/chat_page/chat_page.dart';

class ChatPageReceiver extends StatefulWidget {
  const ChatPageReceiver(
      {super.key, required this.text, this.image, required this.onDelete});
  final String text;
  final File? image;
  final VoidCallback onDelete;
  @override
  // ignore: library_private_types_in_public_api
  _ChatPageReceiver createState() => _ChatPageReceiver();
}

class _ChatPageReceiver extends State<ChatPageReceiver> {
  var date = DateFormat('HH:mm').format(DateTime.now());
  bool isMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double baseHeight = 800;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double fhm = MediaQuery.of(context).size.height / baseHeight;
    double ffem = fem * 0.97;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          GestureDetector(
            onLongPress: () {
              setState(() {
                isMenuOpen = true;
              });
            },
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(191, 219, 209, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10 * fem),
                          topRight: Radius.circular(10 * fem),
                          bottomLeft: Radius.circular(10 * fem),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0 * fem, 0 * fem),
                            blurRadius: 4 * fem,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                10 * fem, 2 * fhm, 5 * fem, 4 * fhm),
                            child: Text(
                              'Павшак Артем',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff278664),
                              ),
                            ),
                          ),
                          if (widget.image != null)
                            Container(
                              width: 350 * fem,
                              height: 350 * fhm,
                              child: Image.file(widget.image!),
                            ),
                          if (widget.text.isNotEmpty)
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  10 * fem, 0, 10 * fem, 5 * fhm),
                              child: Text(
                                '${widget.text}',
                                style: SafeGoogleFont(
                                  'Montserrat',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2175 * ffem / fem,
                                  color: Color(0xff191919),
                                ),
                              ),
                            ),
                          Container(
                            margin:
                                EdgeInsets.fromLTRB(10 * fem, 0, 0, 5 * fhm),
                            child: Text(
                              '$date',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 10 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff278664),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5 * fem),
                    width: 20 * fem,
                    height: 20 * fem,
                    child: Image.asset(
                      'assets/icon/user-avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  if (isMenuOpen)
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Color.fromARGB(255, 23, 90, 90),
                        onPressed: () {
                          setState(() {
                            isMenuOpen = false;
                          });
                        },
                        child: Text(
                          'Удалить',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
