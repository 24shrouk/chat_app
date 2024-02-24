import 'package:flutter/material.dart';
import 'package:new_chat_app/constants.dart';
import 'package:new_chat_app/models/message.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: Color(kPrimaryColor),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ChatBubleForFriends extends StatelessWidget {
  const ChatBubleForFriends({super.key, required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: Color(0xff006D84),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
