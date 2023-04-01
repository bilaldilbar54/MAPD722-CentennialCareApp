import 'package:centennial_care/colors.dart';
import 'package:flutter/material.dart';

class MonitorPatient extends StatefulWidget {
  const MonitorPatient({super.key});

  @override
  State<MonitorPatient> createState() => _MonitorPatientState();
}

class _MonitorPatientState extends State<MonitorPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          "MONITOR PATIENT",
          style: TextStyle(
            color: darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: darkGreen,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: darkGrey),
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
