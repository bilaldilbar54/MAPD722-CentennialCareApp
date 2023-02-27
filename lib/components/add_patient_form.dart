import 'package:flutter/material.dart';
import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:centennial_care/components/custom_textfield.dart';
import 'package:centennial_care/colors.dart';

class AddPatientForm extends StatelessWidget {
  const AddPatientForm({
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  hintText: 'e.g. 644-877-5489',
                  obscureText: false,
                  width: 165,
                  radius: 10,
                  borderColor: darkGrey,
                  backColor: darkGreen,
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
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyButton(
              title: 'CANCEL',
              onTap: '/home',
              width: 165,
            ),
            MyButton(
              title: 'SUBMIT',
              onTap: '',
              width: 165,
            )
          ],
        )
      ],
    );
  }
}
