import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_chat_app/constants.dart';
import 'package:new_chat_app/screens/chat_screen.dart';
import 'package:new_chat_app/widgets/customButton.dart';
import 'package:new_chat_app/widgets/customtextformfeild.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  
  static String id = 'RegisterPage';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      'REGISTER',
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
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnackBar(context, 'There is an error');
                      }
                      isLoaded = false;
                      setState(() {});
                    }
                  },
                  text: 'Register',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Text(
                        ' Login',
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
