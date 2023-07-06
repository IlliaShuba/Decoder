import 'package:flutter/material.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:intl/intl.dart';

class ChatPageSender extends StatefulWidget {
  const ChatPageSender(
      {super.key, required this.text, required this.senderName});
  final String text;
  final String senderName;
  @override
  // ignore: library_private_types_in_public_api
  _ChatPageSender createState() => _ChatPageSender();
}

class _ChatPageSender extends State<ChatPageSender> {
  var date = DateFormat('HH:mm').format(DateTime.now());
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
          SizedBox(height: 15), // Add spacing between the sections
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5 * fem),
                  width: 20 * fem,
                  height: 20 * fem,
                  child: Image.asset(
                    'assets/icon/user-avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(146, 194, 177, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10 * fem),
                        topRight: Radius.circular(10 * fem),
                        bottomRight: Radius.circular(10 * fem),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x4c483f3f),
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
                            '${widget.senderName}',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff278664),
                            ),
                          ),
                        ),
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
                          margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 5 * fhm),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
