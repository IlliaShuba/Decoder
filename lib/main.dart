import 'package:decoder/utils/client_manager.dart';
import 'package:decoder/utils/platform_infos.dart';
import 'package:decoder/widgets/decoder_app.dart';
import 'package:decoder/widgets/lock_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';



void main() async {
  final clients = await ClientManager.getClients();

  final queryParameters = <String, String>{};
  /*if (kIsWeb) {
    queryParameters
        .addAll(Uri.parse(html.window.location.href).queryParameters);
  }*/

  runApp(
    PlatformInfos.isMobile
        ? AppLock(
      builder: (args) => DecoderApp(
        clients: clients,
        queryParameters: queryParameters,
      ),
      lockScreen: LockScreen(), // Replace with your lock screen widget
      enabled: true,
    )
        : DecoderApp(
      clients: clients,
      queryParameters: queryParameters,
    ),
  );
}

