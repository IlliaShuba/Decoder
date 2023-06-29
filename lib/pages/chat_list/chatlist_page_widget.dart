import 'package:flutter_svg/flutter_svg.dart';

import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatlist_page_model.dart';
export 'chatlist_page_model.dart';

class ChatListPageWidget extends StatefulWidget {
  const ChatListPageWidget({Key? key}) : super(key: key);

  @override
  _ChatListPageWidgetState createState() => _ChatListPageWidgetState();
}

class _ChatListPageWidgetState extends State<ChatListPageWidget> {
  late ChatListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListPageModel());
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 9.0, 0.0, 10.0),
              child: IconButton(
                onPressed: () {
                  print('Search IconButton pressed...');
                },
                icon: Image.asset(
                'assets/chat_list/images/user-buttom.png',
                width: 35.0,
                height: 35.0,
                fit: BoxFit.cover,
              ),
          ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      onPressed: () {
                        print('Search IconButton pressed...');
                      },
                      icon: SvgPicture.asset('assets/chat_list/images/tabler_search.svg'),
                      iconSize: 25.0,
                      splashRadius: 20.0,
                      color: Colors.white,
                      disabledColor: Colors.white,
                      focusColor: Colors.white,
                      highlightColor: Colors.white,
                      hoverColor: Colors.white,
                    ),
                  ),
                  //SizedBox(width: 10.0), // Add a SizedBox with width 10.0 for spacing
                  Container(
                    alignment: Alignment.centerRight,
                    //padding: EdgeInsets.only(right: 20.0, top: 15.0, bottom: 0.0),
                    child: IconButton(
                      onPressed: () {
                        print('Edit IconButton pressed...');
                      },
                      icon: SvgPicture.asset('assets/chat_list/images/pepicons-pencil_dots-y.svg'),
                      iconSize: 25.0,
                      splashRadius: 20.0,
                      color: Colors.white,
                      disabledColor: Colors.white,
                      focusColor: Colors.white,
                      highlightColor: Colors.white,
                      hoverColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
            centerTitle: false,
            elevation: 8.0,
          ),
        ),

        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Усі бесіди',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF278664),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 65.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: Color(0x3375704E),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/chat_list/images/user-buttom.png',
                                width: 48.0,
                                height: 48.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 5.0, 0.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Ім\'я користувача',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            '9 травня',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF898989),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Повідомлення',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF898989),
                                              fontSize: 13.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                // First FAB onPressed logic
              },
              child: SvgPicture.asset('assets/chat_list/images/prostors.svg',
                width: 25.0,
                height: 25.0,
              ),
              backgroundColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(height: 10.0,), // Add spacing between FABs
            FloatingActionButton(
              onPressed: () {
                // Second FAB onPressed logic
              },
              child: SvgPicture.asset('assets/chat_list/images/write.svg',
                width: 30.0,
                height: 30.0,
              ),
              backgroundColor: Color(int.parse('0xFF278664')),
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
