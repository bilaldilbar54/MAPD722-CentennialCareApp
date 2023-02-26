import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class RoundButton extends StatelessWidget {
  final String title1;
  final String title2;
  final double width;
  final double height;
  final String onTap;

  const RoundButton(
      {super.key,
      required this.title1,
      required this.title2,
      required this.height,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, onTap);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: darkGreen,
        shape: const CircleBorder(),
        minimumSize: Size(height, width),
      ),
      child: Column(
        children: [
          Text(
            title1,
            style: const TextStyle(color: darkGrey),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title2,
            style: const TextStyle(color: darkGrey),
          ),
        ],
      ),
    );
  }
}
