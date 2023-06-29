
import 'package:decoder/pages/home/homeserver_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../pages/chat_list/chat_list_view.dart';
import '../widgets/loading_view.dart';

class AppRoutes{
  final GoRouter router = GoRouter(
    initialLocation: '/',
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
          ),
          GoRoute(
            name: 'rooms',
            path: 'rooms',
            builder: (BuildContext context, GoRouterState state) {
              return ChatListView();
            },
          ),
        ],
      ),
    ],
  );
}
