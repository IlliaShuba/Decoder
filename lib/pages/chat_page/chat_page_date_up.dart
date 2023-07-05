import 'package:flutter/material.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:intl/intl.dart';

class ChatPageDateUp extends StatelessWidget {
  const ChatPageDateUp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    String capitalizeFirstLetter(String text) {
      if (text.isEmpty) return text;
      return text[0].toUpperCase() + text.substring(1);
    }

    var day = capitalizeFirstLetter(
        DateFormat('EEEE\ndd.MM', 'uk_UA').format(dateTime));
    double baseWidth = 360;
    double baseHeight = 800;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double fhm = MediaQuery.of(context).size.height / baseHeight;
    double ffem = fem * 0.97;
    return Container(
      width: 325 * fem,
      height: 41 * fhm,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 1 * fhm,
              decoration: BoxDecoration(
                color: Color(0xb2278664),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 63 * fem,
            ),
            child: Text(
              '$day',
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Inter',
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2125 * ffem / fem,
                color: Color(0xb2278664),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1 * fhm,
              decoration: BoxDecoration(
                color: Color(0xb2278664),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
