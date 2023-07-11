import 'package:badges/badges.dart';
import 'package:decoder/config/themes.dart';
import 'package:decoder/pages/chat_list/chat_list.dart';
import 'package:decoder/pages/chat_list/navi_rail_item.dart';
import 'package:decoder/pages/chat_list/unread_rooms_badge.dart';
import 'package:decoder/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:decoder/widgets/avatar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/matrix.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:decoder/config/app_config.dart';
import 'package:decoder/pages/chat_list/chat_list_item.dart';

class ChatListView extends StatelessWidget {
  final ChatListController controller;

  const ChatListView(this.controller, {Key? key}) : super(key: key);

  /*final scaffoldKey = GlobalKey<ScaffoldState>();

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
  }*/

  // void toggleSelection(String roomId) {
  //   setState(
  //         () => selectedRoomIds.contains(roomId)
  //         ? selectedRoomIds.remove(roomId)
  //         : selectedRoomIds.add(roomId),
  //   );
  // }

/*
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
  }*/

  List<NavigationDestination> getNavigationDestinations(BuildContext context) {
    final badgePosition = BadgePosition.topEnd(top: -12, end: -8);
    return [
      if (AppConfig.separateChatTypes) ...[
        NavigationDestination(
          icon: UnreadRoomsBadge(
            badgePosition: badgePosition,
            filter:
            controller.getRoomFilterByActiveFilter(ActiveFilter.messages),
            child: const Icon(Icons.forum_outlined),
          ),
          selectedIcon: UnreadRoomsBadge(
            badgePosition: badgePosition,
            filter:
            controller.getRoomFilterByActiveFilter(ActiveFilter.messages),
            child: const Icon(Icons.forum),
          ),
          label: L10n.of(context)!.messages,
        ),
        NavigationDestination(
          icon: UnreadRoomsBadge(
            badgePosition: badgePosition,
            filter: controller.getRoomFilterByActiveFilter(ActiveFilter.groups),
            child: const Icon(Icons.group_outlined),
          ),
          selectedIcon: UnreadRoomsBadge(
            badgePosition: badgePosition,
            filter: controller.getRoomFilterByActiveFilter(ActiveFilter.groups),
            child: const Icon(Icons.group),
          ),
          label: L10n.of(context)!.groups,
        ),
      ] else
        NavigationDestination(
          icon: UnreadRoomsBadge(
            badgePosition: badgePosition,
            filter:
            controller.getRoomFilterByActiveFilter(ActiveFilter.allChats),
            child: const Icon(Icons.forum_outlined),
          ),
          selectedIcon: UnreadRoomsBadge(
            badgePosition: badgePosition,
            filter:
            controller.getRoomFilterByActiveFilter(ActiveFilter.allChats),
            child: const Icon(Icons.forum),
          ),
          label: L10n.of(context)!.chats,
        ),
      if (controller.spaces.isNotEmpty)
        const NavigationDestination(
          icon: Icon(Icons.workspaces_outlined),
          selectedIcon: Icon(Icons.workspaces),
          label: 'Spaces',
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    return StreamBuilder<Object?>(
      stream: Matrix.of(context).onShareContentChanged.stream,
      builder: (_, __) {
        final selectMode = controller.selectMode;
        return VWidgetGuard(
          onSystemPop: (redirector) async {
            final selMode = controller.selectMode;
            if (selMode != SelectMode.normal) {
              controller.cancelAction();
              redirector.stopRedirection();
              return;
            }
            if (controller.activeFilter !=
                (AppConfig.separateChatTypes
                    ? ActiveFilter.messages
                    : ActiveFilter.allChats)) {
              controller
                  .onDestinationSelected(AppConfig.separateChatTypes ? 1 : 0);
              redirector.stopRedirection();
              return;
            }
          },
          child: Row(
            children: [
              if (DecoderThemes.isColumnMode(context) &&
                  DecoderThemes.getDisplayNavigationRail(context)) ...[
                Builder(
                  builder: (context) {
                    final allSpaces =
                        client.rooms.where((room) => room.isSpace);
                    final rootSpaces = allSpaces
                        .where(
                          (space) => !allSpaces.any(
                            (parentSpace) => parentSpace.spaceChildren
                                .any((child) => child.roomId == space.id),
                          ),
                        )
                        .toList();
                    final destinations = getNavigationDestinations(context);

                    return SizedBox(
                      width: DecoderThemes.navRailWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: rootSpaces.length /*+ destinations.length*/,
                        itemBuilder: (context, i) {
                          if (i < destinations.length) {
                            return NaviRailItem(
                              isSelected: i == controller.selectedIndex,
                              onTap: () => controller.onDestinationSelected(i),
                              icon: destinations[i].icon,
                              selectedIcon: destinations[i].selectedIcon,
                              toolTip: destinations[i].label,
                            );
                          }
                          i -= destinations.length;
                          final isSelected =
                              controller.activeFilter == ActiveFilter.spaces &&
                                  rootSpaces[i].id == controller.activeSpaceId;
                          return NaviRailItem(
                            toolTip: rootSpaces[i].getLocalizedDisplayname(
                              MatrixLocals(L10n.of(context)!),
                            ),
                            isSelected: isSelected,
                            onTap: () =>
                                controller.setActiveSpace(rootSpaces[i].id),
                            icon: Avatar(
                              mxContent: rootSpaces[i].avatar,
                              name: rootSpaces[i].getLocalizedDisplayname(
                                MatrixLocals(L10n.of(context)!),
                              ),
                              size: 32,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ],
              Expanded(
                child: GestureDetector(
                  onTap: FocusManager.instance.primaryFocus?.unfocus,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(55.0),
                      child: AppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        leading: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
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
                                  borderSide:
                                      BorderSide(color: Color(0xFFF5F5F5)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFFF5F5F5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFFF5F5F5)),
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
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                    ],
                                    onSelected: (String value) {
                                      // Handle menu item selection here
                                      if (value == 'filterByActivity') {
                                        print('Edit option selected...');
                                      } else if (value == 'filterAscending') {
                                        print('Delete option selected...');
                                      }
                                    },
                                  )),
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'Усі бесіди',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                                //controller: scrollController,
                                children: [
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Anna",
                                      message: "Привіт, як справи???",
                                      date: "5 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Володимир",
                                      message: "Захід розпочнемо одразу",
                                      date: "4 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Balinchenko",
                                      message: "Гаразд",
                                      date: "4 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "olena",
                                      message: "все добре",
                                      date: "4 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Aртем",
                                      message: "Працює!",
                                      date: "3 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Alex",
                                      message: "Тестуємо",
                                      date: "3 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Інесса",
                                      message: "ок",
                                      date: "3 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Anna",
                                      message: "Привіт, як справи???",
                                      date: "3 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Danyliuk",
                                      message: "Привіт",
                                      date: "3 липня"),
                                  Divider(
                                    color: Color(0x3375704E),
                                    thickness: 1,
                                  ),
                                  ChatListItem(
                                      userName: "Nadia Bezruchko",
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
                           /* if (activeFilter == ActiveFilter.spaces) {
                              VRouter.of(context).to('/newspace');
                            }*/
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
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
