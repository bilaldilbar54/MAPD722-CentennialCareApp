import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double width;
  final double radius;
  final Color backColor;
  final Color borderColor;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.width,
      required this.radius,
      required this.backColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: SizedBox(
        width: width,
        height: 45,
        child: TextField(
          maxLines: 1,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: darkGrey,
                  ),
                  borderRadius: BorderRadius.circular(radius)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(radius)),
              fillColor: backColor,
              filled: true),
        ),
      ),
    );
  }
}
