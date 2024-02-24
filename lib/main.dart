import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_chat_app/firebase_options.dart';
import 'package:new_chat_app/screens/chat_screen.dart';
import 'package:new_chat_app/screens/login_screen.dart';
import 'package:new_chat_app/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.logId: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LoginScreen.logId,
    );
  }
}
