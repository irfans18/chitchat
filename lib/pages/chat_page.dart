import 'package:chitchat/models/chat.dart';
import 'package:chitchat/theme/values.dart';
import 'package:chitchat/widgets/appbar_widget.dart';
import 'package:chitchat/widgets/message_item.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Chat _chat;
  String _message = '';

  // PopupMenuButton<ChatDetailMoreMenuOptions> _morePopMenu;
  // List<Message>? _messages;

  late TextEditingController textFieldController;

  // final double _fontSize = 15.0; // default = medium
  final TextInputAction _textInputAction = TextInputAction.newline;

  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    // _prefs.then((SharedPreferences prefs) {
    //   int size = prefs.getInt(SharedPreferencesHelpers.fontSize);
    //   setState(() {
    //     if(size == 0) { // small
    //       _fontSize = 13.0;
    //     }
    //     else if(size == 1) { // medium
    //       _fontSize = 15.0;
    //     }
    //     else if(size == 2) { // large
    //       _fontSize = 18.0;
    //     }
    //   });
    //   bool enterIsSend = prefs.getBool(SharedPreferencesHelpers.enterIsSend) ?? SharedPreferencesHelpers.defaultEnterIsSend;
    //   setState(() {
    //     if(enterIsSend) {
    //       _textInputAction = TextInputAction.send;
    //     }
    //     else {
    //       _textInputAction = TextInputAction.newline;
    //     }
    //   });
    // });

    // _chat = widget.chat;
    // int chatId = widget.chat?.id ?? widget.id;
    // _fMessages =
    //     ChatService.getChat(chatId).then((chat) {
    //       setState(() {
    //         _chat = chat;
    //         _messages = chat.messages.reversed.toList();
    //       });
    //       return null;
    //     });
    // _morePopMenu = PopupMenuButton<ChatDetailMoreMenuOptions>(
    //   onSelected: _onSelectMoreMenuOption,
    //   itemBuilder: (BuildContext context) {
    //     return [
    //       PopupMenuItem<ChatDetailMoreMenuOptions>(
    //         child: Text('Report'),
    //         value: ChatDetailMoreMenuOptions.report,
    //       ),
    //       PopupMenuItem<ChatDetailMoreMenuOptions>(
    //         child: Text('Block'),
    //         value: ChatDetailMoreMenuOptions.block,
    //       ),
    //       PopupMenuItem<ChatDetailMoreMenuOptions>(
    //         child: Text('Clear chat'),
    //         value: ChatDetailMoreMenuOptions.clearChat,
    //       ),
    //       PopupMenuItem<ChatDetailMoreMenuOptions>(
    //         child: Text('Export chat'),
    //         value: ChatDetailMoreMenuOptions.exportChat,
    //       ),
    //       PopupMenuItem<ChatDetailMoreMenuOptions>(
    //         child: Text('Add shortcut'),
    //         value: ChatDetailMoreMenuOptions.addShortcut,
    //       ),
    //     ];
    //   },
    // );
    textFieldController = TextEditingController()
      ..addListener(() {
        setState(() {
          _message = textFieldController.text;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    chatBubble({String? message, bool? isYou = true}) {
      return MessageItem(
        content: message,
        timestamp: DateTime(2021),
        isYou: isYou,
      );
    }

    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(title: 'User'),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    chatBubble(message: 'tes'),
                    chatBubble(message: 'halo', isYou: false),
                    chatBubble(message: 'hola'),
                    chatBubble(message: 'tes', isYou: false),
                    chatBubble(message: 'tes'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              padding: const EdgeInsets.all(0.0),
                              disabledColor: iconColor,
                              color: iconColor,
                              icon: const Icon(Icons.insert_emoticon),
                              onPressed: () {},
                            ),
                            Flexible(
                              child: TextField(
                                controller: textFieldController,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: _textInputAction,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0.0),
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(
                                    color: textFieldHintColor,
                                    fontSize: 16.0,
                                  ),
                                  counterText: '',
                                ),
                                onSubmitted: (String text) {
                                  if (_textInputAction ==
                                      TextInputAction.send) {
                                    _sendMessage();
                                  }
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                maxLength: 100,
                              ),
                            ),
                            IconButton(
                              color: iconColor,
                              icon: Icon(Icons.attach_file),
                              onPressed: () {},
                            ),
                            _message.isEmpty || _message == null
                                ? IconButton(
                                    color: iconColor,
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: () {},
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: FloatingActionButton(
                        elevation: 2.0,
                        backgroundColor: secondaryColor,
                        foregroundColor: Colors.white,
                        child: _message.isEmpty || _message == null
                            ? const Icon(Icons.settings_voice)
                            : const Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  int offsetUnsentMessage = 0;

  void _sendMessage() {
    if (_message == null || _message.isEmpty) return;

    // ChatService.updateChat(_chat.id, _message).then((chat) {
    //   setState(() {
    //     _messages[offsetUnsentMessage-1].isSent = true;
    //     offsetUnsentMessage--;
    //   });
    // });

    // setState(() {
    //   _messages.insert(
    //     0,
    //       Message(
    //         content: _message,
    //         timestamp: DateTime.now(),
    //         isRead: false,
    //         isYou: true,
    //         isSent: false,
    //       )
    //   );
    //   offsetUnsentMessage++;
    //   _message = '';
    //   textFieldController.text = '';
    // });
  }
}
