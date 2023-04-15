import 'package:centennial_care/components/monitor_patient_view.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MonitorPatient extends StatelessWidget {
  const MonitorPatient({super.key});

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
      body: const SafeArea(
        child: MonitorPatientWidget()
      ),
    );
  }
}
