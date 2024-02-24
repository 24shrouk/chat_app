import 'package:flutter/material.dart';
import 'package:new_chat_app/constants.dart';
import 'package:new_chat_app/models/message.dart';
import 'package:new_chat_app/widgets/Chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String id = 'chatPage';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(
                Message.fromJson(snapshot.data!.docs[i]),
              );
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(kPrimaryColor),
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    kLogo,
                    height: 60,
                  ),
                  const Text(
                    'chat',
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBuble(
                                  message: messagesList[index],
                                )
                              : ChatBubleForFriends(
                                  message: messagesList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          KeyMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email,
                        });
                        _controller.animateTo(
                          0,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 500),
                        );
                        controller.clear();
                      },
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.send,
                            color: Color(kPrimaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(kPrimaryColor),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator());
          }
        });
  }
}
