import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGreen,
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: lightGreen,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('lib/images/doc.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to',
                  style: TextStyle(color: darkGrey, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'CENTENNIAL CARE',
                  style: TextStyle(color: darkGrey, fontSize: 28),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Login Below',
                  style: TextStyle(color: darkGrey, fontSize: 23, fontFamily: ),
                ),

                //Username Field

                //Password Field

                //Login Button
              ],
            ),
          ),
        ));
  }
}
