import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({required this.text,this.onTap});
  String text;
  VoidCallback? onTap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(text)),
      ),
    );
  }
}
