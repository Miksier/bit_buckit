import 'package:flutter/material.dart';

class CircularTextField extends StatelessWidget {
  final TextEditingController urlController;
  final String hintString;
  final bool obscureText;
  const CircularTextField({this.urlController, this.hintString, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextField(
        controller: urlController,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintString,
            hintStyle: TextStyle(color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
