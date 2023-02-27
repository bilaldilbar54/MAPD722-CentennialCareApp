import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';
import '../components/add_patient_form.dart';

class AddPatient extends StatelessWidget {
  AddPatient({super.key});

  final patientIdController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final weightController = TextEditingController();
  final reportController = TextEditingController();
  final addressController = TextEditingController();
  final pNumController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final doctorController = TextEditingController();
  final wardController = TextEditingController();

  void resetForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'ADD NEW PATIENT',
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
                      'PATIENT ADDITION FORM:',
                      style: TextStyle(fontSize: 31, color: darkGrey),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: AddPatientForm(
                        patientIdController: patientIdController,
                        fNameController: fNameController,
                        lNameController: lNameController,
                        ageController: ageController,
                        genderController: genderController,
                        weightController: weightController,
                        reportController: reportController,
                        addressController: addressController,
                        pNumController: pNumController,
                        dateOfBirthController: dateOfBirthController,
                        doctorController: doctorController,
                        wardController: wardController,
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
