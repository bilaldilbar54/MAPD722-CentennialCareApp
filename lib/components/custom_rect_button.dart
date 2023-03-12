import 'package:centennial_care/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final double width;
  final Function()? onPressed;

  const MyButton({
    super.key,
    required this.title,
    required this.width,
    required this.onPressed,
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
            onPressed?.call();
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
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darkGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
