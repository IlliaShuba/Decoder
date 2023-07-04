import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/matrix.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:matrix/matrix.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:decoder/config/app_config.dart';
import 'package:decoder/pages/chat_list/chat_list_item.dart';
import 'chat_list.dart';
export 'chat_list.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  late ChatList _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatList());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  // void toggleSelection(String roomId) {
  //   setState(
  //         () => selectedRoomIds.contains(roomId)
  //         ? selectedRoomIds.remove(roomId)
  //         : selectedRoomIds.add(roomId),
  //   );
  // }



  String? activeSpaceId;

  ActiveFilter activeFilter = AppConfig.separateChatTypes
      ? ActiveFilter.messages
      : ActiveFilter.allChats;

  void resetActiveSpaceId() {
    setState(() {
      activeSpaceId = null;
    });
  }

  void setActiveSpace(String? spaceId) {
    setState(() {
      activeSpaceId = spaceId;
      activeFilter = ActiveFilter.spaces;
    });
  }

  int get selectedIndex {
    switch (activeFilter) {
      case ActiveFilter.allChats:
      case ActiveFilter.messages:
        return 0;
      case ActiveFilter.groups:
        return 1;
      case ActiveFilter.spaces:
        return AppConfig.separateChatTypes ? 2 : 1;
    }
  }

  ActiveFilter getActiveFilterByDestination(int? i) {
    switch (i) {
      case 1:
        if (AppConfig.separateChatTypes) {
          return ActiveFilter.groups;
        }
        return ActiveFilter.spaces;
      case 2:
        return ActiveFilter.spaces;
      case 0:
      default:
        if (AppConfig.separateChatTypes) {
          return ActiveFilter.messages;
        }
        return ActiveFilter.allChats;
    }
  }

  void onDestinationSelected(int? i) {
    setState(() {
      activeFilter = getActiveFilterByDestination(i);
    });
  }

  List<Room> get filteredRooms => Matrix.of(context)
      .client
      .rooms
      .where(_model.getRoomFilterByActiveFilter(activeFilter))
      .toList();

  bool isSearchMode = false;
  Future<QueryPublicRoomsResponse>? publicRoomsResponse;
  String? searchServer;
  //Timer? _coolDown;
  SearchUserDirectoryResponse? userSearchResult;
  QueryPublicRoomsResponse? roomSearchResult;






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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: IconButton(
                onPressed: () {
                  print('Search IconButton pressed...');
                },
                icon: Image.asset(
                'assets/chat_list/images/user-buttom.png',
                width: 40.0,
                height: 40.0,
                //fit: BoxFit.cover,
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
                    Divider(
                      color: Color(0x3375704E),
                      thickness: 1,
                    ),
                    ChatListItem(),
                    Divider(
                      color: Color(0x3375704E),
                      thickness: 1,
                    ),
                    ChatListItem(),
                    Divider(
                      color: Color(0x3375704E),
                      thickness: 1,
                    )
                    // Container(
                    //   width: double.infinity,
                    //   height: 65.0,
                    //   decoration: BoxDecoration(
                    //     color: FlutterFlowTheme.of(context).secondaryBackground,
                    //     border: Border.all(
                    //       color: Color(0x3375704E),
                    //       width: 1.5,
                    //     ),
                    //   ),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsetsDirectional.fromSTEB(
                    //             20.0, 0.0, 0.0, 0.0),
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(8.0),
                    //           child: Image.asset(
                    //             'assets/chat_list/images/user-buttom.png',
                    //             width: 48.0,
                    //             height: 48.0,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Padding(
                    //           padding: EdgeInsetsDirectional.fromSTEB(
                    //               20.0, 5.0, 0.0, 5.0),
                    //           child: Column(
                    //             mainAxisSize: MainAxisSize.max,
                    //             children: [
                    //               Row(
                    //                 mainAxisSize: MainAxisSize.max,
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Align(
                    //                     alignment:
                    //                         AlignmentDirectional(-1.0, 0.0),
                    //                     child: Text(
                    //                       'Ім\'я користувача',
                    //                       style: FlutterFlowTheme.of(context)
                    //                           .bodyMedium
                    //                           .override(
                    //                             fontFamily: 'Montserrat',
                    //                             color: Colors.black,
                    //                             fontSize: 17.0,
                    //                             fontWeight: FontWeight.w500,
                    //                           ),
                    //                     ),
                    //                   ),
                    //                   Align(
                    //                     alignment:
                    //                         AlignmentDirectional(1.0, -1.0),
                    //                     child: Padding(
                    //                       padding:
                    //                           EdgeInsetsDirectional.fromSTEB(
                    //                               0.0, 0.0, 20.0, 0.0),
                    //                       child: Text(
                    //                         '9 травня',
                    //                         style: FlutterFlowTheme.of(context)
                    //                             .bodyMedium
                    //                             .override(
                    //                               fontFamily: 'Montserrat',
                    //                               color: Color(0xFF898989),
                    //                               fontSize: 12.0,
                    //                               fontWeight: FontWeight.normal,
                    //                             ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Expanded(
                    //                 child: Align(
                    //                   alignment:
                    //                       AlignmentDirectional(-1.0, 0.0),
                    //                   child: Text(
                    //                     'Повідомлення',
                    //                     style: FlutterFlowTheme.of(context)
                    //                         .bodyMedium
                    //                         .override(
                    //                           fontFamily: 'Montserrat',
                    //                           color: Color(0xFF898989),
                    //                           fontSize: 13.0,
                    //                         ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
                if (activeFilter == ActiveFilter.spaces){
                  VRouter.of(context).to('/newspace');
                }
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
                switch (activeFilter) {
                  case ActiveFilter.allChats:
                  case ActiveFilter.messages:
                    VRouter.of(context).to('/newprivatechat');
                    break;
                  case ActiveFilter.groups:
                    VRouter.of(context).to('/newgroup');
                    break;
                }

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
