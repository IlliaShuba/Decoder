import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:matrix/matrix.dart';
import 'package:vrouter/vrouter.dart';

import 'package:decoder/config/app_config.dart';
import 'package:decoder/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:decoder/utils/room_status_extension.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import '../../config/themes.dart';
import '../../utils/date_time_extension.dart';
//import '../../widgets/avatar.dart';
import '../../widgets/matrix.dart';

class ChatListItem extends StatelessWidget {
  final String userName;
  final String message;
  final String date;
  final bool activeChat;
  //final Room room;
  final bool selected;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const ChatListItem(/*this.room,*/ {
    required this.userName,
    required this.message,
    required this.date,
    this.activeChat = false,
    this.selected = false,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  void clickAction(BuildContext context) async {}

  Future<void> archiveAction(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    // final isMuted = room.pushRuleState != PushRuleState.notify;
    // final typingText = room.getLocalizedTypingText(context);
    // final ownMessage =
    //     room.lastEvent?.senderId == Matrix.of(context).client.userID;
    // final unread = room.isUnread || room.membership == Membership.invite;
    // final unreadBubbleSize = unread || room.hasNewMessages
    //     ? room.notificationCount > 0
    //     ? 20.0
    //     : 14.0
    //     : 0.0;
    // final displayname = room.getLocalizedDisplayname(
    //   MatrixLocals(L10n.of(context)!),
    // );

    return GestureDetector(
        onTap: () {
          VRouter.of(context).to('/chat-page');
        },
        child: Container(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            onTap: onTap,
            onLongPress: onLongPress,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/chat_list/images/user-buttom.png',
                width: 48.0,
                height: 48.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userName,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  date,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF898989),
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
            subtitle: Text(
              message,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF898989),
                    fontSize: 13.0,
                  ),
            ),
          ),
        ));

    // return Container(
    //   // decoration: BoxDecoration(
    //   //   border: Border.all(
    //   //     color: Colors.grey,
    //   //     width: 1.0,
    //   //   ),
    //   // ),
    //   child: ListTile(
    //     contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    //     onTap: onTap,
    //     onLongPress: onLongPress,
    //     leading: ClipRRect(
    //       borderRadius: BorderRadius.circular(8.0),
    //       child: Image.asset(
    //         'assets/chat_list/images/user-buttom.png',
    //         width: 48.0,
    //         height: 48.0,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           'Ім\'я користувача',
    //           style: FlutterFlowTheme.of(context).bodyMedium.override(
    //             fontFamily: 'Montserrat',
    //             color: Colors.black,
    //             fontSize: 17.0,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         Text(
    //           '9 травня',
    //           style: FlutterFlowTheme.of(context).bodyMedium.override(
    //             fontFamily: 'Montserrat',
    //             color: Color(0xFF898989),
    //             fontSize: 12.0,
    //             fontWeight: FontWeight.normal,
    //           ),
    //         ),
    //       ],
    //     ),
    //     subtitle: Text(
    //       'Повідомлення',
    //       style: FlutterFlowTheme.of(context).bodyMedium.override(
    //         fontFamily: 'Montserrat',
    //         color: Color(0xFF898989),
    //         fontSize: 13.0,
    //       ),
    //     ),
    //   ),
    //
    // );
  }
}
