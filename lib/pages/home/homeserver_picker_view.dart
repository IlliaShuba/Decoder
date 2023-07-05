import 'package:decoder/pages/home/homeserver_picker.dart';
import 'package:decoder/pages/login/login.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';


class HomeserverPickerView extends StatelessWidget {
  final HomeserverPickerController controller;

  const HomeserverPickerView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double baseHeight = 800;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double fhm = MediaQuery.of(context).size.height / baseHeight;
    return Scaffold(
      body: Container(
        // androidlarge99Xz (1:1043)
        padding: EdgeInsets.fromLTRB(20*fem, 140*fhm, 20*fem, 100*fhm),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoALc (1:1044)
              margin: EdgeInsets.fromLTRB(77*fem, 0*fhm, 76*fem, 25*fhm),
              width: double.infinity,
              height: 164*fhm,
              child: Stack(
                children: [
                  Positioned(
                    // group6f2U (1:1045)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 167*fem,
                        height: 164*fhm,
                        child: Image.asset(
                          'assets/icon/logo-background.png',
                          width: 167*fem,
                          height: 164*fhm,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // maskgroupZ7r (1:1048)
                    left: 30.8460693359*fem,
                    top: 29.7723999023*fhm,
                    child: Align(
                      child: SizedBox(
                        width: 104.96*fem,
                        height: 104.96*fhm,
                        child: Image.asset(
                          'assets/icon/lock.png',
                          width: 104.96*fem,
                          height: 104.96*fhm,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // ef6 (1:1051)
              margin: EdgeInsets.fromLTRB(2*fem, 0*fhm, 0*fem, 306*fhm),
              child: Text(
                'Захищений мессенджер',
                style: SafeGoogleFont (
                  'Montserrat',
                  fontSize: 14*fhm,
                  fontWeight: FontWeight.w300,
                  height: 1.2175*fhm,
                  color: Color(0xff278664),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: controller.isLoading
                  ? null
                  : controller.checkHomeserverAction,
              style:ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff278664),
                minimumSize: const Size(double.infinity, 42),
                padding: EdgeInsets.fromLTRB(94.57*fem, 9*fhm, 90.43*fem, 9*fhm),
              ),
              icon:  Image.asset('assets/icon/primeng-icons-v500.png', width: 16*fem, height: 16*fhm,),
              label:Text(
                // 8RT (7:17)
                L10n.of(context)!.start,
                style: SafeGoogleFont (
                  'Montserrat',
                  fontSize: 15*fhm,
                  fontWeight: FontWeight.w600,
                  height: 1.2102272034*fhm,
                  letterSpacing: 0.45*fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
