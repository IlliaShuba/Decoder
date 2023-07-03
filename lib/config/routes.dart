
import 'package:decoder/pages/chat_list/chat_list.dart';
import 'package:decoder/pages/home/homeserver_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../pages/connect/connect_page.dart';
import '../pages/login/login.dart';
import '../widgets/loading_view.dart';

class AppRoutes{
  final GoRouter router = GoRouter(
    initialLocation: '/home/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoadingView();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'home',
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return HomeserverPicker();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'login',
                builder: (BuildContext context, GoRouterState state) => const Login(),
              ),
              GoRoute(
                path: 'connect',
                builder: (context, state) => const ConnectPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'login',
                    builder: (context, state) => const Login(),
                  ),
                ],
              ),
            ],
          ),

          GoRoute(
            name: 'rooms',
            path: 'rooms',
            builder: (BuildContext context, GoRouterState state) {
              return ChatList();
            },
          ),
        ],
      ),
    ],
  );
}
