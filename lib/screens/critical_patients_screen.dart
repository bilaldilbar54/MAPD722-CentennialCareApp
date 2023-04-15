import 'package:centennial_care/components/critical_patient_view.dart';
import 'package:centennial_care/components/patient_data_api.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class CriticalPatients extends StatelessWidget {
  late Future<List<dynamic>> _futureCriticalData;
  CriticalPatients({super.key});

  @override
  Widget build(BuildContext context) {
    _futureCriticalData = fetchPatientsCriticalRecords();

    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'CRITICAL PATIENTS',
          style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
        ),
        backgroundColor: darkGreen,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: darkGrey),
      ),
      body: SafeArea(
        child: CriticalPatientWidget(futureCriticalData: _futureCriticalData),
      ),
    );
  }
}