import 'package:new_chat_app/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(json) {
    return Message(json[KeyMessage], json['id']);
  }
}
