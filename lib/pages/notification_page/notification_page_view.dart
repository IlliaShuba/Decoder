import 'package:vrouter/vrouter.dart';

import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_page_model.dart';
export 'notification_page_model.dart';

class NotificationPageWidget extends StatefulWidget {
  const NotificationPageWidget({Key? key}) : super(key: key);

  @override
  _NotificationPageWidgetState createState() => _NotificationPageWidgetState();
}

class _NotificationPageWidgetState extends State<NotificationPageWidget> {
  late NotificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 25.0,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xFF278664),
                  size: 20.0,
                ),
                onPressed: () async {
                  VRouter.of(context).to('/settings');
              }, 
              ),
              title: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Сповіщення',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 3.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Сповіщення',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF278664),
                                  fontSize: 15.0,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Увімкнути сповіщення для\n цього облікового запису',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  65.0, 0.0, 0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.switchValue ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue = newValue!);
                                },
                                activeColor: Color(0xFFBFBFBF),
                                activeTrackColor: Color(0xFFEDEDED),
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Увімкнути сповіщення для\n цього пристрою',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  65.0, 0.0, 0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.switchValue ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue = newValue!);
                                },
                                activeColor: Color(0xFFBFBFBF),
                                activeTrackColor: Color(0xFFEDEDED),
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Типові сповіщення',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF278664),
                                  fontSize: 15.0,
                                ),
                          ),
                        ),Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Згадки та ключові слова',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF278664),
                                  fontSize: 15.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Інше',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF278664),
                                  fontSize: 15.0,
                                ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xB279A471),
                        ),
                        Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                          child: Text(
                              'Сповіщення е-поштою',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF278664),
                                    fontSize: 15.0,
                            ),
                          ),
                        ),                        
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Увімкнути сповіщення\nе-поштою для',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'username',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xB279A471),
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(105.0, 0.0, 0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.switchValue ??= true,
                                onChanged: (newValue) async {
                                  setState(() => _model.switchValue = newValue!);
                                },
                                activeColor: Color(0xFFBFBFBF),
                                activeTrackColor: Color(0xFFEDEDED),
                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),                   
                        Divider(
                          thickness: 1.0,
                          color: Color(0xB279A471),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Налаштування сповіщень',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF278664),
                                  fontSize: 15.0,
                                ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Метод сповіщення',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Служби Google',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xB279A471),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Налаштування гучних сповіщень',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Виберіть колір світлодіода, вібрацію, звук...',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xB279A471),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Налаштування тихих сповіщень',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Виберіть колір світлодіода, вібрацію, звук...',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xB279A471),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Налаштування сповіщень викликів',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Виберіть колір світлодіода, вібрацію, звук...',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xB279A471),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xB379A471),
                        ),
                        Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Усунення несправностей',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Полагодити сповіщення',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF278664),
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),                                  
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToStart(SizedBox(height: 25.0)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
