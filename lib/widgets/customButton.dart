import 'package:flutter/material.dart';
import 'package:new_chat_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});

  VoidCallback? onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Color(
                  kPrimaryColor,
                ),
                fontSize: 24),
          ),
        ),
      ),
    );
  }
}
