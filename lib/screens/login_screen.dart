import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_chat_app/constants.dart';
import 'package:new_chat_app/screens/chat_screen.dart';
import 'package:new_chat_app/screens/register_screen.dart';
import 'package:new_chat_app/widgets/customButton.dart';
import 'package:new_chat_app/widgets/customtextformfeild.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String logId = 'LoginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  bool isLoaded = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        backgroundColor: const Color(kPrimaryColor),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                const Text(
                  'Chat App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 110,
                ),
                const Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                    onChange: (data) {
                      email = data;
                    },
                    hint: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                    obscurText: true,
                    onChange: (data) {
                      password = data;
                    },
                    hint: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoaded = true;
                      setState(() {});

                      try {
                        await loginUser();
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        print(e);
                        showSnackBar(context, 'There is an error');
                      }
                      isLoaded = false;
                      setState(() {});
                    }
                  },
                  text: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: const Text(
                        ' Register',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
