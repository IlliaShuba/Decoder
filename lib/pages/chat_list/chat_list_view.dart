import 'package:decoder/pages/chat_page/chat_page.dart';
import 'package:decoder/pages/settings_page/settings_page.dart';
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

  bool showSearchField = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    _model = createModel(context, () => ChatList());
  }

  @override
  void dispose() {
    _model.dispose();
    scrollController.removeListener(_onScroll);

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

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> scrolledToTop = ValueNotifier(true);

  void _onScroll() {
    final newScrolledToTop = scrollController.position.pixels <= 0;
    if (newScrolledToTop != scrolledToTop.value) {
      scrolledToTop.value = newScrolledToTop;
    }
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: IconButton(
                onPressed: () {
                  VRouter.of(context).to('/settings');
                },
                icon: Image.asset(
                  'assets/chat_list/images/user-buttom.png',
                  width: 40.0,
                  height: 40.0,
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            title: Align(
              alignment: Alignment.center,
              child: Container(
                height: 33.0,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFF5F5F5),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    decoration: TextDecoration.none,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFFF5F5F5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFFF5F5F5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFFF5F5F5)),
                    ),
                  ),
                  // Customize other properties of the TextField as needed
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
                        setState(() {
                          showSearchField = !showSearchField;
                        });
                      },
                      icon: SvgPicture.asset(
                          'assets/chat_list/images/tabler_search.svg'),
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
                      child: PopupMenuButton<String>(
                        offset: Offset(0, 40),
                        icon: SvgPicture.asset(
                            'assets/chat_list/images/pepicons-pencil_dots-y.svg'),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'filterByActivity',
                            child: Row(
                              children: [
                                const SizedBox(width: 8.0),
                                Text(
                                  'Упорядкувати\n за активністю',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF675F5F),
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'filterAscending',
                            child: Row(
                              children: [
                                const SizedBox(width: 8.0),
                                Text(
                                  'Упорядкувати А-Я',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF675F5F),
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'logout',
                          child: Row(
                            children: [
                              const SizedBox(width: 8.0),
                              Text(
                                  'Вийти',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF675F5F),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                      onSelected: (String value) {
                        // Handle menu item selection here
                        if (value == 'filterByActivity') {
                          print('Edit option selected...');
                        } else if (value == 'filterAscending') {
                          print('Delete option selected...');
                        }  else if(value == 'logout') {
                        
                        }
                      },
                    )
                  ),
                ],
              ),
            ],
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
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    children: [
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(userName: "Anna"),
                            ),
                          );
                        },
                        userName: "Anna",
                        message: "Привіт, як справи???",
                        date: "5 липня",
                      ),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Володимир"),
                              ),
                            );
                          },
                          userName: "Володимир",
                          message: "Захід розпочнемо одразу",
                          date: "4 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Balinchenko"),
                              ),
                            );
                          },
                          userName: "Balinchenko",
                          message: "Гаразд",
                          date: "4 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "olena"),
                              ),
                            );
                          },
                          userName: "olena",
                          message: "все добре",
                          date: "4 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Артем"),
                              ),
                            );
                          },
                          userName: "Aртем",
                          message: "Працює!",
                          date: "3 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Alex"),
                              ),
                            );
                          },
                          userName: "Alex",
                          message: "Тестуємо",
                          date: "3 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Інесса"),
                              ),
                            );
                          },
                          userName: "Інесса",
                          message: "ок",
                          date: "3 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Anna"),
                              ),
                            );
                          },
                          userName: "Anna",
                          message: "Привіт, як справи???",
                          date: "3 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Danyliuk"),
                              ),
                            );
                          },
                          userName: "Danyliuk",
                          message: "Привіт",
                          date: "3 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                      ChatListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(userName: "Nadia"),
                              ),
                            );
                          },
                          userName: "Nadia",
                          message: "Ок",
                          date: "3 липня"),
                      Divider(
                        color: Color(0x3375704E),
                        thickness: 1,
                      ),
                    ],
                  ),
                )
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
                if (activeFilter == ActiveFilter.spaces) {
                  VRouter.of(context).to('/newspace');
                }
              },
              child: SvgPicture.asset(
                'assets/chat_list/images/prostors.svg',
                width: 25.0,
                height: 25.0,
              ),
              backgroundColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              height: 10.0,
            ), // Add spacing between FABs
            PopupMenuButton<ActiveFilter>(
              offset: Offset(-65, 0),
              onSelected: (filter) {
                switch (filter) {
                  case ActiveFilter.allChats:
                  case ActiveFilter.messages:
                    VRouter.of(context).to('/newprivatechat');
                    break;
                  case ActiveFilter.groups:
                    VRouter.of(context).to('/newgroup');
                    break;
                  case ActiveFilter.spaces:
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  // PopupMenuItem<ActiveFilter>(
                  //   value: ActiveFilter.allChats,
                  //   child: Text(
                  //       'All Chats',
                  //       style: FlutterFlowTheme.of(context).bodyMedium.override(
                  //       fontFamily: 'Montserrat',
                  //       color: Color(0xFF675F5F),
                  //       fontSize: 14,
                  //     ),
                  //   ),
                  // ),
                  PopupMenuItem<ActiveFilter>(
                    value: ActiveFilter.messages,
                    child: Text(
                      'Нова бесіда',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF675F5F),
                            fontSize: 14,
                          ),
                    ),
                  ),
                  PopupMenuItem<ActiveFilter>(
                    value: ActiveFilter.groups,
                    child: Text(
                      'Нова група',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF675F5F),
                            fontSize: 14,
                          ),
                    ),
                  ),
                ];
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(int.parse('0xFF278664')),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/chat_list/images/write.svg',
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
              ),
            )
            // FloatingActionButton(
            //   onPressed: () {
            //     switch (activeFilter) {
            //       case ActiveFilter.allChats:
            //       case ActiveFilter.messages:
            //         VRouter.of(context).to('/newprivatechat');
            //         break;
            //       case ActiveFilter.groups:
            //         VRouter.of(context).to('/newgroup');
            //         break;
            //     }
            //
            //   },
            //   child: SvgPicture.asset('assets/chat_list/images/write.svg',
            //     width: 30.0,
            //     height: 30.0,
            //   ),
            //   backgroundColor: Color(int.parse('0xFF278664')),
            //   elevation: 5,
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            // ),
            // SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
