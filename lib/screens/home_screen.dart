import 'package:centennial_care/components/home_bottom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/components/home_feelings.dart';
import 'package:centennial_care/colors.dart';
import 'package:centennial_care/components/home_greet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          "CENTENNIAL-CARE HOME",
          style: TextStyle(
            color: darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: darkGreen,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('lib/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: const [
                HomeGreet(),
                FeelingEmoji(),
                HomeButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
