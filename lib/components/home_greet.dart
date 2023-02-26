import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class HomeGreet extends StatelessWidget {
  const HomeGreet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: 500,
        height: 170,
        decoration: BoxDecoration(
            color: darkGrey, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/avatar.png'),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Good Morning!',
                      style: TextStyle(
                        color: green,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Dr. David Mason',
                      style: TextStyle(
                        color: green,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
