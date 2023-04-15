import 'package:flutter/material.dart';
import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:centennial_care/components/custom_textfield.dart';
import 'package:centennial_care/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void loginClicked(BuildContext context) {
    if (usernameController.text == 'admin' &&
        passwordController.text == 'admin') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      const snackBar =
          SnackBar(content: Text('Incorrect username or password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                        radius: 100,
                        width: 500,
                        borderColor: darkGreen,
                        backColor: lightGrey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Valid Username';
                          }
                          return null;
                        },
                      ),
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        radius: 100,
                        width: 500,
                        borderColor: darkGreen,
                        backColor: lightGrey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Correct Password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginClicked(context);
                    }
                  },
                  title: 'LOGIN',
                  width: 550,
                )
              ],
            ),
          ),
        ));
  }
}
