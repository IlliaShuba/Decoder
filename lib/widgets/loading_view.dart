import 'package:decoder/widgets/empty_page.dart';
import 'package:decoder/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:matrix/matrix.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        /// helper class checking for updates on platforms without store release
        //await UpdateCheckerNoStore(context).checkUpdate();
        context.go(
          Matrix.of(context).widget.clients.any(
                    (client) =>
                        client.onLoginStateChanged.value == LoginState.loggedIn,
                  )
              ? '/rooms'
              : '/home',
        );
      },
    );
    return const EmptyPage(loading: true);
  }
}
