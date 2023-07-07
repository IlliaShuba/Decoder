import 'dart:io';

import 'package:decoder/pages/chat_page/chat_page_date_up.dart';
import 'package:decoder/pages/chat_page/chat_page_receiver.dart';
import 'package:decoder/pages/chat_page/chat_page_sender.dart';
import 'package:decoder/pages/home/homeserver_picker.dart';
import 'package:flutter/material.dart';
import 'package:decoder/utils/custom_scroll_behavior.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:vrouter/vrouter.dart';

class ChatPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  File? image;
  bool _isEmojiVisible = false;
  List<Widget> chatPageReceiverList = [];

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick $e');
    }
  }

  final TextEditingController _textEditingController = TextEditingController();

  void selectEmoji(String emoji) {
    setState(() {
      _textEditingController.text += emoji;
    });
  }

  void sendMessage() {
    String text = _textEditingController.text;
    if (text.isNotEmpty || image != null) {
      setState(() {
        if (text.isNotEmpty) {
          chatPageReceiverList
              .add(ChatPageReceiver(text: _textEditingController.text));
        }
        if (image != null) {
          chatPageReceiverList.add(ChatPageReceiver(
            text: _textEditingController.text,
            image: image,
          ));
          image = null;
        }
      });
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double baseHeight = 800;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double fhm = MediaQuery.of(context).size.height / baseHeight;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              leadingWidth: 195 * fem,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              leading: Row(
                children: [
                  SizedBox(
                    width: 12 * fem,
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        VRouter.of(context).to('/rooms');
                      },
                      icon: Image.asset(
                        'assets/icon/backbutton.png',
                        width: 25 * fem,
                        height: 25 * fhm,
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon/user-avatar.png',
                      ),
                      iconSize: 35 * fem,
                    ),
                  ),
                  SizedBox(
                    width: 4 * fem,
                  ),
                  Container(
                    child: Text(
                      'User',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2175 * ffem / fem,
                        color: Color(0xff278664),
                      ),
                    ),
                  ),
                ],
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Align(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icon/ph-video-camera-fill.png',
                                  width: 25 * fem,
                                  height: 25 * fhm,
                                ),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icon/ic-baseline-phone.png',
                                  width: 20 * fem,
                                  height: 20 * fhm,
                                ),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icon/pepicons-pencil-dots-y.png',
                                  width: 25 * fem,
                                  height: 25 * fhm,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50 * fhm),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20 * fem),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // СПІВРОЗМОВНИК!!!!!!!!!!!!!
                      ChatPageDateUp(),
                      ChatPageSender(text: 'Text'),
                      ChatPageSender(text: 'Text'),
                      ChatPageSender(text: 'Text'),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      // ВІДПОВІДАЧ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      ...chatPageReceiverList,
                      SizedBox(
                        height: 10 * fem,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomAppBar(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(left: 15 * fem),
                    child: Padding(
                      padding:
                          EdgeInsets.fromLTRB(8 * fem, 0, 8 * fem, 8 * fhm),
                      child: Ink(
                        width: 40 * fem,
                        height: 40 * fhm,
                        decoration: BoxDecoration(
                          color: Color(0xff278664),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: IconButton(
                          onPressed: () => pickImage(ImageSource.gallery),
                          icon: Image.asset(
                            'assets/icon/white-plus.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 220 * fem,
                    child: Stack(
                      children: [
                        // Зелений контейнер
                        Container(
                          child: Expanded(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10 * fhm),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                border: Border.all(color: Color(0xff278664)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20 * fem, 0, 0, 5 * fhm),
                          height: 50 * fhm,
                          width: 160 * fem,
                          decoration: BoxDecoration(),
                          child: TextField(
                            onTap: () {
                              setState(() {
                                _isEmojiVisible = false;
                              });
                            },
                            controller: _textEditingController,
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Повідомлення...',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2175 * ffem / fem,
                                color: Color.fromARGB(177, 139, 170, 133),
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(170 * fem, 3 * fhm, 0, 0),
                          width: 40 * fem,
                          height: 40 * fhm,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isEmojiVisible = !_isEmojiVisible;
                              });
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            },
                            icon: const Icon(Icons.emoji_emotions),
                            color: Color(0xb279a471),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10 * fem, 1 * fhm, 0, 0),
                    width: 40 * fem,
                    height: 40 * fhm,
                    decoration: BoxDecoration(
                      color: Color(0xff278664),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: IconButton(
                      onPressed: sendMessage,
                      icon: Image.asset(
                        'assets/icon/img-for-send.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isEmojiVisible)
              Container(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji emoji) {
                    selectEmoji(emoji.emoji);
                  },
                  config: Config(
                    columns: 8,
                    emojiSizeMax: 28 * (Platform.isIOS ? 1.30 : 1.0),
                    categoryIcons: CategoryIcons(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
