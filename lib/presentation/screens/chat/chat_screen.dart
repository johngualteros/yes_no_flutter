import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_flutter/domain/entities/message.dart';
import 'package:yes_no_flutter/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_flutter/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_flutter/presentation/widgets/shared/message_field_box.dart';

import '../../providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> list = <String>['Main', 'Red', 'Pink', 'Purple', 'Deep Purple', 'Indigo', 'Blue', 'Light Blue', 'Cyan', 'Teal', 'Green'];
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://e0.pxfuel.com/wallpapers/813/924/desktop-wallpaper-cute-for-girls-anime-girl-avatar.jpg'),
          ),
        ),
        title: const Text('My love 💛'),
        centerTitle: false,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return const [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Change Theme"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: const Text('Select the theme'),
                        content: DropdownMenu<String>(
                          initialSelection: list[0],
                          onSelected: (String? value) {},
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ));
                  });
            }
          }),
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // see the changes of provider
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  if (message.fromWho == FromWho.me) {
                    return MyMessageBubble(message: message);
                  } else {
                    return HerMessageBubble(message: message);
                  }
                },
              ),
            ),
            MessageFieldBox(
                onValue: (value) => chatProvider.sendMessage(value)),
          ],
        ),
      ),
    );
  }
}
