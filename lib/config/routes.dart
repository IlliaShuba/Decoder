import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';

import '../pages/chat_list/chat_list.dart';
import '../pages/chat_list/chat_list_view.dart';
import '../pages/connect/connect_page.dart';
import '../pages/home/homeserver_picker.dart';
import '../pages/login/login.dart';
import '../widgets/loading_view.dart';

class AppRoutes {
  final bool columnMode;

  AppRoutes(this.columnMode);

  List<VRouteElement> get routes => [
        ..._homeRoutes,
        //if (columnMode) ..._tabletRoutes,
        if (!columnMode) ..._mobileRoutes,
      ];

  List<VRouteElement> get _mobileRoutes => [
        VWidget(
          path: '/rooms',
          widget: ChatList(),
        ),
        VWidget(
          path: '/settings',
          widget: Container(),
          stackedRoutes: _settingsRoutes,
        ),
      ];

  List<VRouteElement> get _settingsRoutes => [
    VWidget(
        path: 'general',
      widget:  Container(),
      buildTransition: _dynamicTransition,
    ),
  ];

  List<VRouteElement> get _homeRoutes => [
    VWidget(path: '/', widget: const LoadingView()),
    VWidget(
      path: '/home',
      widget: const HomeserverPicker(),
      buildTransition: _fadeTransition,
      stackedRoutes: [
        VWidget(
          path: 'login',
          widget: const Login(),
          buildTransition: _fadeTransition,
        ),
        VWidget(
          path: 'connect',
          widget: const ConnectPage(),
          buildTransition: _fadeTransition,
          stackedRoutes: [
            VWidget(
              path: 'login',
              widget: const Login(),
              buildTransition: _fadeTransition,
            ),
          ],
        ),
      ],
    ),
  ];

  FadeTransition Function(dynamic, dynamic, dynamic)? get _dynamicTransition =>
      columnMode ? _fadeTransition : null;

  FadeTransition _fadeTransition(animation1, _, child) =>
      FadeTransition(opacity: animation1, child: child);
}
