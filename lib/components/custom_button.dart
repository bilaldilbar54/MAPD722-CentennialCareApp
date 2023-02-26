import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MyButton extends StatelessWidget {
  final String onTap;
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, onTap);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(darkGreen),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            elevation: MaterialStateProperty.all<double>(5.0)),
        child: Container(
          padding: const EdgeInsets.all(25),
          child: const Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: darkGrey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
