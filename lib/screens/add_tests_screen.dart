import 'package:centennial_care/colors.dart';
import 'package:centennial_care/components/add_test_form.dart';
import 'package:flutter/material.dart';

class AddTest extends StatelessWidget {
  AddTest({super.key});

  final nurseNameController = TextEditingController();
  final systolicValController = TextEditingController();
  final diastolicValController = TextEditingController();
  final respRateValController = TextEditingController();
  final bloodOxyLvlValController = TextEditingController();
  final heartBeatRateValController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'ADD PATIENT TEST',
          style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
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
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'PATIENT TESTS ADDITION:',
                      style: TextStyle(fontSize: 31, color: darkGrey),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: AddPatientTest(
                        nurseNameController: nurseNameController,
                        systolicValController: systolicValController,
                        diastolicValController: diastolicValController,
                        respRateValController: respRateValController,
                        bloodOxyLvlValController: bloodOxyLvlValController,
                        heartBeatRateValController: heartBeatRateValController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
