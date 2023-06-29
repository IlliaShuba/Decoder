import 'dart:js_interop';

import 'package:decoder/pages/chat_list/chat_list.dart';
import 'package:decoder/pages/chat_list/chatlist_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:decoder/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ChatListView extends StatelessWidget {

  final ChatListController controller;
  const ChatListView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatListPageWidget();
  }
}