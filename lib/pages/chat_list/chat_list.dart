
import 'package:decoder/utils/matrix_sdk_extensions/client_stories_extension.dart';

import '../../widgets/matrix.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:vrouter/vrouter.dart';

import 'package:decoder/config/app_config.dart';
import 'package:decoder/config/themes.dart';

enum SelectMode {
  normal,
  share,
  select,
}

enum PopupMenuAction {
  settings,
  invite,
  newGroup,
  newSpace,
  setStatus,
  archive,
}

enum ActiveFilter {
  allChats,
  groups,
  messages,
  spaces,
}


class ChatList extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
  ///
  ///


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

  bool Function(Room) getRoomFilterByActiveFilter(ActiveFilter activeFilter) {
    switch (activeFilter) {
      case ActiveFilter.allChats:
        return (room) => !room.isSpace && !room.isStoryRoom;
      case ActiveFilter.groups:
        return (room) =>
        !room.isSpace && !room.isDirectChat && !room.isStoryRoom;
      case ActiveFilter.messages:
        return (room) =>
        !room.isSpace && room.isDirectChat && !room.isStoryRoom;
      case ActiveFilter.spaces:
        return (r) => r.isSpace;
    }
  }

  void editSpace(BuildContext context, String spaceId) async {
    await Matrix.of(context).client.getRoomById(spaceId)!.postLoad();
    //if (mounted) {
      //VRouter.of(context).toSegments(['spaces', spaceId]);
    //}
  }






}
