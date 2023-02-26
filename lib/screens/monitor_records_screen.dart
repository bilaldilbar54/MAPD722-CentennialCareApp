import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MonitorRecords extends StatelessWidget {
  const MonitorRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'MONITOR RECORDS',
          style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
        ),
        backgroundColor: lightGreen,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: darkGrey),
      ),
    );
  }
}
