import 'package:decoder/widgets/matrix.dart';
import 'package:decoder/widgets/theme_builder.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:vrouter/vrouter.dart';


import '../config/app_config.dart';
import '../config/routes.dart';
import '../config/themes.dart';

class DecoderApp extends StatefulWidget {
  final Widget? testWidget;
  final List<Client> clients;
  final Map<String, String>? queryParameters;
  static GlobalKey<VRouterState> routerKey = GlobalKey<VRouterState>();

  const DecoderApp({
    Key? key,
    this.testWidget,
    required this.clients,
    this.queryParameters,
  }) : super(key: key);


  /// getInitialLink may rereturn the value multiple times if this view is
  /// opened multiple times for example if the user logs out after they logged
  /// in with qr code or magic link.
  static bool gotInitialLink = false;

  @override
  State<StatefulWidget> createState() => DecoderAppState();
}

class DecoderAppState extends State<DecoderApp> {

  String? _initialUrl;
  ThemeMode? _themeMode;
  Color? _primaryColor;
  bool? columnMode;

  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;

  Color? get primaryColor => _primaryColor;

  static DecoderAppState of(BuildContext context) =>
      Provider.of<DecoderAppState>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _initialUrl = widget.clients.any((client) => client.isLogged()) ? '/room' : '/home';
  }

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, themeMode, primaryColor) => LayoutBuilder(
          builder: (context, constraints) {
            final isColumnMode =
            DecoderThemes.isColumnModeByWidth(constraints.maxWidth);
            if (isColumnMode != columnMode) {
              Logs().v('Set Column Mode = $isColumnMode');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _initialUrl = DecoderApp.routerKey.currentState?.url;
                  columnMode = isColumnMode;
                  DecoderApp.routerKey = GlobalKey<VRouterState>();
                });
              });
            }
            return VRouter(
              key: DecoderApp.routerKey,
              title: AppConfig.applicationName,
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: DecoderThemes.buildTheme(Brightness.light, primaryColor),
              darkTheme: DecoderThemes.buildTheme(Brightness.dark, primaryColor),
              //scrollBehavior: CustomScrollBehavior(),
              logs: kReleaseMode ? VLogs.none : VLogs.info,
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              initialUrl: _initialUrl ?? '/',
              routes: AppRoutes(columnMode ?? false).routes,
              builder: (context, child) => Matrix(
                context: context,
                router: DecoderApp.routerKey,
                clients: widget.clients,
                child: child,
              ),
            );
          },
        ),
      );
  }
}