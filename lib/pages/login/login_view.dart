import 'package:decoder/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../../config/app_config.dart';
import '../../utils/custom_scroll_behavior.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;

  const LoginView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double baseHeight = 800;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double fhm = MediaQuery.of(context).size.height / baseHeight;
    return Scaffold(
        body: controller.loading
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: AppConfig.primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  // loginpagefZW (1:1063)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 80 * fem, 20 * fem, 311 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group3mMe (1:1073)
                        margin: EdgeInsets.fromLTRB(
                            123 * fem, 0 * fem, 122.56 * fem, 50 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle2VYY (1:1074)
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38.33 * fem,
                                  height: 72 * fem,
                                  child: Image.asset(
                                    'assets/icon/rectangle-2.png',
                                    width: 38.33 * fem,
                                    height: 72 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse1Cxk (1:1075)
                              left: 5.0953369141 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 69.34 * fem,
                                  height: 72 * fem,
                                  child: Image.asset(
                                    'assets/icon/ellipse-1.png',
                                    width: 69.34 * fem,
                                    height: 72 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // maskgroup748 (1:1076)
                              left: 16.6153869629 * fem,
                              top: 13.0707702637 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 46.08 * fem,
                                  height: 46.08 * fem,
                                  child: Image.asset(
                                    'assets/icon/mask-group-6aQ.png',
                                    width: 46.08 * fem,
                                    height: 46.08 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // CbN (1:1064)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 48 * fem),
                        child: Text(
                          'Вхід',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 32 * fhm,
                            fontWeight: FontWeight.w300,
                            height: 1.2175 * fhm,
                            color: Color(0xff191919),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          1 * fem,
                          0 * fem,
                          0 * fem,
                          40 * fem,
                        ),
                        width: 320 * fem,
                        child: TextField(
                          onChanged: (text) {
                            controller.validate();
                            controller.checkWellKnownWithCoolDown;
                          },
                          readOnly: controller.loading,
                          autocorrect: false,
                          autofocus: true,
                          controller: controller.usernameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: controller.loading
                              ? null
                              : [AutofillHints.username],
                          decoration: InputDecoration(
                            hintText: L10n.of(context)!.username,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff278665),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff278664),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                              12 * fem,
                              16 * fem,
                              12 * fem,
                              16 * fem,
                            ),
                          ),
                          maxLines: 1,
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 13*fhm,
                            fontWeight: FontWeight.w300,
                            height: 1.2175*fhm,
                            color: Color(0xff79a471),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          1 * fem,
                          0 * fem,
                          0 * fem,
                          40 * fem,
                        ),
                        width: 320 * fem,
                        child: TextField(
                          onChanged: (text) {
                            controller.validate();
                          },
                          readOnly: controller.loading,
                          autocorrect: false,
                          autofillHints: controller.loading
                              ? null
                              : [AutofillHints.password],
                          controller: controller.passwordController,
                          textInputAction: TextInputAction.go,
                          obscureText: !controller.showPassword,
                          onSubmitted: (_) => controller.login(),
                          decoration: InputDecoration(
                            hintText: L10n.of(context)!.password,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff278665),
                              ),
                              borderRadius: BorderRadius.circular(10*fem),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff278664),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10*fem),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                              12 * fem,
                              16 * fem,
                              12 * fem,
                              16 * fem,
                            ),
                            suffixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: IconButton(
                                onPressed: controller.toggleShowPassword,
                                icon: Icon(
                                  controller.showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xff278664),
                                ),
                              ),
                            ),
                          ),
                          maxLines: 1,
                          style: SafeGoogleFont (
                            'Montserrat',
                            fontSize: 13*fhm,
                            fontWeight: FontWeight.w300,
                            height: 1.2175*fhm,
                            color: Color(0xff79a471),
                          ),
                        ),
                      ),
                      Container(
                        // btn2sE (1:1079)
                        margin: EdgeInsets.fromLTRB(
                            89 * fem, 0 * fem, 90 * fem, 0 * fem),
                        width: 141 * fem,
                        height: 43 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff278664),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: ElevatedButton(
                          onPressed:
                              controller.loading ? null : controller.login,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23.0), // Задайте бажане значення радіусу
                            ),
                            backgroundColor: const Color(0xff278664),
                            elevation: 6.0,
                            textStyle: SafeGoogleFont(
                              'Inter',
                              fontSize: 18 * fhm,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * fhm,
                              color: const Color(0xff7c7c7c),
                            ),
                          ),
                          child: Text(
                            L10n.of(context)!.next,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 16 * fhm,
                              fontWeight: FontWeight.w400,
                              height: 0.85 * fhm,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
