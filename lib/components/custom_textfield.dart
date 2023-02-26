import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: darkGrey,
                ),
                borderRadius: BorderRadius.circular(100)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: darkGreen,
                ),
                borderRadius: BorderRadius.circular(100)),
            fillColor: lightGrey,
            filled: true),
      ),
    );
  }
}
