import 'package:centennial_care/screens/add_patients_screen.dart';
import 'package:centennial_care/screens/critical_patients_screen.dart';
import 'package:centennial_care/screens/home_screen.dart';
import 'package:centennial_care/screens/login_screen.dart';
import 'package:centennial_care/screens/monitor_patient_screen.dart';
import 'package:centennial_care/screens/monitor_records_screen.dart';
import 'package:centennial_care/screens/view_patients_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
        '/addPatient': (context) => AddPatient(),
        '/viewPatients': (context) => const ViewPatients(),
        '/monitorRecords': (context) => const MonitorRecords(),
        '/monitorPatient': (context) => const MonitorPatient(),
        '/criticalPatients': (context) => CriticalPatients(),
      },
    );
  }
}
