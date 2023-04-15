import 'package:centennial_care/components/patient_data_api.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:centennial_care/components/custom_textfield.dart';
import 'package:centennial_care/colors.dart';

class AddPatientForm extends StatelessWidget {
  AddPatientForm({
    Key? key,
    required this.patientIdController,
    required this.fNameController,
    required this.lNameController,
    required this.ageController,
    required this.genderController,
    required this.weightController,
    required this.reportController,
    required this.addressController,
    required this.pNumController,
    required this.dateOfBirthController,
    required this.doctorController,
    required this.wardController,
  }) : super(key: key);

  final TextEditingController patientIdController;
  final TextEditingController fNameController;
  final TextEditingController lNameController;
  final TextEditingController ageController;
  final TextEditingController genderController;
  final TextEditingController weightController;
  final TextEditingController reportController;
  final TextEditingController addressController;
  final TextEditingController pNumController;
  final TextEditingController dateOfBirthController;
  final TextEditingController doctorController;
  final TextEditingController wardController;
  final _formKey = GlobalKey<FormState>();

  void clearForm() {
    patientIdController.clear();
    fNameController.clear();
    lNameController.clear();
    ageController.clear();
    genderController.clear();
    weightController.clear();
    reportController.clear();
    addressController.clear();
    pNumController.clear();
    dateOfBirthController.clear();
    doctorController.clear();
    wardController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'PATIENT ID:',
            style: TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
          MyTextField(
            controller: patientIdController,
            hintText: '',
            obscureText: false,
            width: 500,
            radius: 10,
            borderColor: darkGrey,
            backColor: darkGreen,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Patient ID';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'FIRST NAME:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: fNameController,
                    hintText: 'e.g Richard',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient First Name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'LAST NAME:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: lNameController,
                    hintText: 'e.g Louis',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Last Name';
                      }
                      return null;
                    },
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'AGE:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: ageController,
                    hintText: 'e.g 35',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Age';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'GENDER:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: genderController,
                    hintText: 'i.e Male/Female',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Gender';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'WEIGHT:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: weightController,
                    hintText: 'e.g 80Kg',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Weight';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'REPORT:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: reportController,
                    hintText: 'e.g Heart Disease',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Report';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'ADDRESS:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: addressController,
                    hintText: 'e.g. 329 Yonge Street',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Address';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'PHONE NUMBER:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: pNumController,
                    hintText: 'e.g. 6448775489',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient Phone Number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'DATE OF BIRTH:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: dateOfBirthController,
                    hintText: 'e.g 10/12/1995',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Patient DOB';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'DOCTOR:',
                    style:
                        TextStyle(color: darkGrey, fontWeight: FontWeight.w700),
                  ),
                  MyTextField(
                    controller: doctorController,
                    hintText: 'e.g. Dr. Lee',
                    obscureText: false,
                    width: 165,
                    radius: 10,
                    borderColor: darkGrey,
                    backColor: darkGreen,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Assigned Doctor';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              const Text(
                'WARD ASSIGNMENT:',
                style: TextStyle(
                  color: darkGrey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              MyTextField(
                controller: wardController,
                hintText: 'i.e. WARD A - Room: A123',
                obscureText: false,
                width: 500,
                radius: 10,
                borderColor: darkGrey,
                backColor: darkGreen,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Assigned Ward';
                  }
                  return null;
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                title: 'CANCEL',
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Stack(children: [
                        AlertDialog(
                          title: const Text('Exit'),
                          content: const Text('Are you sure you want to exit?'),
                          actions: <Widget>[
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(darkGrey),
                              ),
                              child: const Text(
                                'Clear Form',
                                style: TextStyle(color: lightGreen),
                              ),
                              onPressed: () {
                                clearForm();
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(darkGrey),
                              ),
                              child: const Text(
                                'Go To Home',
                                style: TextStyle(color: lightGreen),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                          backgroundColor: darkGreen,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: darkGrey, width: 2.0),
                          ), // set the shape of the dialog
                        ),
                      ]);
                    },
                  )
                },
                width: 165,
              ),
              MyButton(
                title: 'SUBMIT',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await addPatientRecord(
                        patientId: patientIdController.text,
                        firstName: fNameController.text,
                        lastName: lNameController.text,
                        age: int.parse(ageController.text),
                        gender: genderController.text,
                        weight: weightController.text,
                        report: reportController.text,
                        address: addressController.text,
                        phoneNumber: pNumController.text,
                        dateOfBirth: dateOfBirthController.text,
                        doctor: doctorController.text,
                        ward: wardController.text,
                      );
                      const snackBar =
                          SnackBar(content: Text('Patient Added Successfully'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context, true);
                    } catch (error) {
                      print('Error: $error');
                    }
                  }
                },
                width: 165,
              )
            ],
          )
        ],
      ),
    );
  }
}
