import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/wigets/chat/her_massage_bubble.dart';
import 'package:yes_no_app/presentation/wigets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/wigets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pyxis.nymag.com/v1/imgs/971/c8f/82a1a936660d1de34ee6aea916cc8d7b12-20-jennifer-aniston.w710.jpg'),
          ),
        ),
        title: const Text('Cocha 🖤'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
              child: MessageFieldBox(
                onValue: chatProvider.sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
