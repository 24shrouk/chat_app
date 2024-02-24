import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {super.key, this.hint, this.onChange, this.obscurText = false});

  final String? hint;
  bool obscurText;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}
