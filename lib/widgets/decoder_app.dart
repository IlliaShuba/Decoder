import 'package:decoder/widgets/matrix.dart';
import 'package:decoder/widgets/theme_builder.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';


import '../config/routes.dart';
import '../config/themes.dart';

class DecoderApp extends StatefulWidget {

  final Widget? testWidget;
  final List<Client> clients;
  final Map<String, String>? queryParameters;

  const DecoderApp({
    Key? key,
    this.testWidget,
    required this.clients,
    this.queryParameters,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => DecoderAppState();
}

class DecoderAppState extends State<DecoderApp> {

  String? _initialUrl;
  ThemeMode? _themeMode;
  Color? _primaryColor;

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
            /*if (isColumnMode != columnMode) {
              Logs().v('Set Column Mode = $isColumnMode');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _initialUrl = brigadachatApp.routerKey.currentState?.url;
                  columnMode = isColumnMode;
                  brigadachatApp.routerKey = GlobalKey<VRouterState>();
                });
              });
            }*/
            return MaterialApp.router(
              localizationsDelegates: L10n.localizationsDelegates,
              routerConfig: AppRoutes().router,
              builder: (context, child) => Matrix(
                context: context,
                clients: widget.clients,
                router: AppRoutes().router,
                child: child,
              ),

            );
          },
        ),
      );
  }
}