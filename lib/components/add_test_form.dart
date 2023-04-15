import 'package:centennial_care/colors.dart';
import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:centennial_care/components/custom_textfield.dart';
import 'package:centennial_care/components/patient_data_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPatientTest extends StatelessWidget {
  var patientId;
  var firstName;
  var lastName;
  var ward;

  AddPatientTest({
    Key? key,
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.ward,
    required this.nurseNameController,
    required this.systolicValController,
    required this.diastolicValController,
    required this.respRateValController,
    required this.bloodOxyLvlValController,
    required this.heartBeatRateValController,
  }) : super(key: key);

  final TextEditingController nurseNameController;
  final TextEditingController systolicValController;
  final TextEditingController diastolicValController;
  final TextEditingController respRateValController;
  final TextEditingController bloodOxyLvlValController;
  final TextEditingController heartBeatRateValController;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Enter Nurse Name:',
            style: TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
          MyTextField(
            controller: nurseNameController,
            hintText: 'Enter Nurse Name:',
            obscureText: false,
            width: 500,
            radius: 10,
            borderColor: darkGrey,
            backColor: darkGreen,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Nurse Name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'BLOOD PRESSURE:',
            style: TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextField(
                controller: systolicValController,
                hintText: 'e.g Systolic',
                obscureText: false,
                width: 165,
                radius: 10,
                borderColor: darkGrey,
                backColor: darkGreen,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty || value == '0') {
                    return 'Enter Valid Systolic';
                  }
                  return null;
                },
              ),
              MyTextField(
                controller: diastolicValController,
                hintText: 'e.g Diastolic',
                obscureText: false,
                width: 165,
                radius: 10,
                borderColor: darkGrey,
                backColor: darkGreen,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty || value == '0') {
                    return 'Enter Valid Diastolic';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'RESPIRATORY RATE:',
            style: TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
          MyTextField(
            controller: respRateValController,
            hintText: 'Respiratory Rate (X/min)',
            obscureText: false,
            width: 500,
            radius: 10,
            borderColor: darkGrey,
            backColor: darkGreen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.isEmpty || value == '0') {
                return 'Enter Valid Respiratory Rate';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'BLOOD OXYGEN LEVEL:',
            style: TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
          MyTextField(
            controller: bloodOxyLvlValController,
            hintText: 'Blood Oxygen Level (X%)',
            obscureText: false,
            width: 500,
            radius: 10,
            borderColor: darkGrey,
            backColor: darkGreen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.isEmpty || value == '0') {
                return 'Enter Valid Blood Oxygen Level';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'HEARTBEAT RATE:',
            style: TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
          MyTextField(
            controller: heartBeatRateValController,
            hintText: 'Heartbeat Rate (X/min)',
            obscureText: false,
            width: 500,
            radius: 10,
            borderColor: darkGrey,
            backColor: darkGreen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.isEmpty || value == '0') {
                return 'Enter Heartbeat Rate';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                title: 'CANCEL',
                onPressed: () => Navigator.pop(context, true),
                width: 165,
              ),
              MyButton(
                title: 'SUBMIT',
                onPressed: (() {
                  if (_formKey.currentState!.validate()) {
                    postTestData(
                      patientId,
                      firstName,
                      lastName,
                      ward,
                      nurseNameController.text,
                      diastolicValController.text,
                      systolicValController.text,
                      respRateValController.text,
                      bloodOxyLvlValController.text,
                      heartBeatRateValController.text,
                    );
                    const snackBar = SnackBar(
                        content: Text('Critical Record Added Successfully'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  }
                }),
                width: 165,
              )
            ],
          )
        ],
      ),
    );
  }
}
