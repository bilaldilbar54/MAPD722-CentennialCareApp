import 'package:flutter/material.dart';
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
              )),
          child: Center(
              child: Column(children: [
            const HomeGreet(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: 500,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/gradient_back.png'),
                      fit: BoxFit.fill)),
              child: Column(children: const []),
            )
          ])),
        ),
      ),
    );
  }
}
