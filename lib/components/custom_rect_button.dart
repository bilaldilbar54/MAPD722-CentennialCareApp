import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MyButton extends StatelessWidget {
  final String title;
  final String onTap;
  final double width;
  const MyButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: SizedBox(
        width: width,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, onTap);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(darkGreen),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(5.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: darkGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
