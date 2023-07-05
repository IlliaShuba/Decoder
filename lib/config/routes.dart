import 'dart:core';

import 'package:decoder/pages/chat_page/chat_page.dart';
import 'package:decoder/pages/preference_page/preference_page.dart';
import 'package:decoder/pages/settings_page/settings_page.dart';
import 'package:decoder/pages/notification_page/notification_page_view.dart';
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
          widget: ChatListView(),
        ),
        VWidget(
          path: '/chat-page',
          widget: ChatPage(),
        ),
        VWidget(
          path: '/settings',
          widget: SettingsPage(),
          stackedRoutes: _settingsRoutes,
        ),
      ];

  List<VRouteElement> get _settingsRoutes => [

    VWidget(
        path: 'general',
      widget:  Container(),
      buildTransition: _dynamicTransition,
    ),
    VWidget(
      path: '/preference', 
      widget: PreferencePage(),
      buildTransition: _dynamicTransition,
    ),
    VWidget(
      path: '/notification', 
      widget: NotificationPageWidget(),
      buildTransition: _dynamicTransition,
    )
  ];

  List<VRouteElement> get _homeRoutes => [
    VWidget(path: '/', widget: const LoadingView()),
    VWidget(
      path: '/home',
      widget: const HomeserverPicker(),
      buildTransition: _fadeTransition,
      stackedRoutes: [

        VWidget(
          path: 'general',
          widget: Container(),
          buildTransition: _dynamicTransition,
        ),
        VWidget(
          path: '/preference',
          widget: PreferencePage(),
          buildTransition: _dynamicTransition,
        )
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
