import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, this.hintText, this.onchange, this.obscureText = false});
  String? hintText;
  Function(String)? onchange;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'this field requierd';
        }
        return null;
      },
      obscureText: obscureText!,
      onChanged: onchange,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 248, 243, 243),
        ),
      ),
    );
  }
}
