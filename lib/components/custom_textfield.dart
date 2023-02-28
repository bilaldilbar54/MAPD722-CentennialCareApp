import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double width;
  final double radius;
  final Color backColor;
  final Color borderColor;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.width,
    required this.radius,
    required this.backColor,
    required this.borderColor,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: SizedBox(
        width: widget.width,
        height: 48,
        child: TextField(
          maxLines: 1,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: darkGrey,
                  ),
                  borderRadius: BorderRadius.circular(widget.radius)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.radius)),
              fillColor: widget.backColor,
              filled: true),
        ),
      ),
    );
  }
}
