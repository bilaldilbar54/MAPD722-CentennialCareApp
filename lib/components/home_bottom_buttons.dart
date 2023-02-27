import 'package:flutter/material.dart';
import 'package:centennial_care/components/custom_round_button.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              RoundButton(
                title1: 'ADD',
                title2: 'PATIENTS',
                width: 120,
                height: 120,
                onTap: '/addPatient',
              ),
              RoundButton(
                title1: 'VIEW',
                title2: 'PATIENTS',
                width: 120,
                height: 120,
                onTap: '/viewPatients',
              ),
              RoundButton(
                title1: 'MONITOR',
                title2: 'RECORDS',
                width: 120,
                height: 120,
                onTap: '/monitorRecords',
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              RoundButton(
                title1: 'CRITICAL',
                title2: 'PATIENTS',
                height: 120,
                width: 120,
                onTap: '/criticalPatients',
              ),
              RoundButton(
                title1: 'LOGOUT',
                title2: '🔚',
                height: 120,
                width: 120,
                onTap: '/',
              )
            ],
          )
        ],
      ),
    );
  }
}
