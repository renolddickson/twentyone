import 'package:flutter/material.dart';
import 'package:twentyone/Widgets/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextField(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.purple, blurRadius: 5, spreadRadius: 0)
      ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: bgcolor, filled: true, hintText: hintText),
      ),
    );
  }
}
