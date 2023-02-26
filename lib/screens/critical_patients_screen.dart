import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class CriticalPatients extends StatelessWidget {
  const CriticalPatients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'CRITICAL PATIENTS',
          style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
        ),
        backgroundColor: lightGreen,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: darkGrey),
      ),
    );
  }
}
