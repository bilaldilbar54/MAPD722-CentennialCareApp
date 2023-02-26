import 'package:flutter/material.dart';
import 'package:centennial_care/components/custom_button.dart';
import 'package:centennial_care/components/custom_textfield.dart';
import 'package:centennial_care/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginClicked() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGreen,
        appBar: AppBar(
          title: const Text(
            'CENTENNIAL-CARE',
            style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
          ),
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
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Username Field
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                //Password Field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Login Button
                const MyButton(onTap: '/home')
              ],
            ),
          ),
        ));
  }
}
