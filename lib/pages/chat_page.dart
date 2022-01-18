import 'package:chitchat/widgets/appbar_widget.dart';
import 'package:chitchat/widgets/message_item.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    chatBubble(){
      return const ClipRRect(
        child: Text('data'),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'User'),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  chatBubble(),
                  chatBubble(),
                  chatBubble(),
                  MessageItem(
                    content: 'tes',
                    timestamp: new DateTime(2021),
                    isYou: true,
                  ),
                  MessageItem(
                    content: 'tes',
                    timestamp: new DateTime(2021),
                    isYou: false,
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}