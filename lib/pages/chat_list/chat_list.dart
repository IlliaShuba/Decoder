
import 'package:decoder/pages/chat_list/chat_list_view.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ChatListController();

}
class ChatListController extends State<ChatList>{
  @override
  Widget build(BuildContext context) {
    return ChatListView();
  }

}