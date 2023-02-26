import 'package:centennial_care/components/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:centennial_care/colors.dart';

class FeelingEmoji extends StatelessWidget {
  const FeelingEmoji({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 500,
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/gradient_back.png'),
              fit: BoxFit.fill)),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'How are you feeling',
            style: TextStyle(
              color: darkGrey,
              fontSize: 23,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'today?',
            style: TextStyle(color: darkGrey, fontSize: 23),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        MyAlertDialog.show(
                          context,
                          title: '😄',
                          message: "All is well",
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                      child: const Text(
                        '😄',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )),
                  const Text(
                    'Relaxed',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        MyAlertDialog.show(
                          context,
                          title: '😐',
                          message: "All will be well",
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                      child: const Text(
                        '😐',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )),
                  const Text(
                    'Stressed',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        MyAlertDialog.show(
                          context,
                          title: '😔',
                          message: "We Hope you Have A Good Day",
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                      child: const Text(
                        '😔',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )),
                  const Text(
                    'Sick',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  )
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
