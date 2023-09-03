import 'package:flutter/material.dart';
import 'package:yes_no_flutter/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_flutter/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hi sweet', fromWho: FromWho.me),
    Message(text: 'I need asked you something', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    moveScrollToEnd();
  }

  Future<void> herReply() async {
    final herMessage = await _getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
  }

  Future<void> moveScrollToEnd() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
