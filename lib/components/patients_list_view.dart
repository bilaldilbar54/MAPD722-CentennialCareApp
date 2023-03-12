import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:centennial_care/components/custom_textfield.dart';
import 'package:centennial_care/components/patient_data_api.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({
    Key? key,
    required Future<List> futureData,
  })  : _futureData = futureData,
        super(key: key);

  final Future<List> _futureData;

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<dynamic>>(
        future: widget._futureData,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Card(
                    color: darkGreen,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: darkGrey, width: 0.9),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                data:
                                    'PATIENT ID: ${snapshot.data![index]['patientId']}',
                                color: darkGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  TextWidget(
                                    data:
                                        'NAME: ${snapshot.data![index]['firstName']}',
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    align: TextAlign.start,
                                  ),
                                  const SizedBox(width: 2),
                                  TextWidget(
                                    data: snapshot.data![index]['lastName'],
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    align: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data: 'AGE: ${snapshot.data![index]['age']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'WEIGHT: ${snapshot.data![index]['weight']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'ADDRESS: ${snapshot.data![index]['address']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'PHONE NUMBER: ${snapshot.data![index]['phoneNumber']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'DATE OF BIRTH: ${snapshot.data![index]['dateOfBirth']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'REPORT: ${snapshot.data![index]['report']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'DOCTOR: ${snapshot.data![index]['doctor']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'ASSIGNED: ${snapshot.data![index]['ward']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'ADMITTED ON: ${snapshot.data![index]['createdAt']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'LAST UPDATED: ${snapshot.data![index]['updatedAt']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                align: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          iconSize: 15,
                          onPressed: () {
                            updatePatientData(context, snapshot, index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: darkGrey,
                        width: 0.9,
                      ),
                    ),
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(darkGreen),
                      strokeWidth: 5,
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  Future<dynamic> updatePatientData(BuildContext context,
      AsyncSnapshot<List<dynamic>> snapshot, int index) async {
    TextEditingController weightController =
        TextEditingController(text: snapshot.data![index]['weight']);
    TextEditingController reportController =
        TextEditingController(text: snapshot.data![index]['report']);
    TextEditingController addressController =
        TextEditingController(text: snapshot.data![index]['address']);
    TextEditingController phoneNumberController =
        TextEditingController(text: snapshot.data![index]['phoneNumber']);
    TextEditingController wardController =
        TextEditingController(text: snapshot.data![index]['ward']);
    return showModalBottomSheet(
      isDismissible: false,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      backgroundColor: lightGreen,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'UPDATE PATIENT INFO:',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/patient.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      data:
                          'PATIENT ID - ${snapshot.data![index]['patientId']}',
                      color: darkGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          data: 'NAME: ${snapshot.data![index]['firstName']}',
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.start,
                        ),
                        const SizedBox(width: 2),
                        TextWidget(
                          data: snapshot.data![index]['lastName'],
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      data: 'AGE: ${snapshot.data![index]['age']}',
                      color: darkGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          data: 'WEIGHT:',
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.center,
                        ),
                        MyTextField(
                            controller: weightController,
                            hintText: 'hintText',
                            obscureText: false,
                            width: 150,
                            radius: 20,
                            backColor: lightGreen,
                            borderColor: darkGrey),
                      ],
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          data: 'REPORT:',
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.center,
                        ),
                        MyTextField(
                            controller: reportController,
                            hintText: 'hintText',
                            obscureText: false,
                            width: 150,
                            radius: 20,
                            backColor: lightGreen,
                            borderColor: darkGrey),
                      ],
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          data: 'ADDRESS:',
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.center,
                        ),
                        MyTextField(
                            controller: addressController,
                            hintText: 'hintText',
                            obscureText: false,
                            width: 150,
                            radius: 20,
                            backColor: lightGreen,
                            borderColor: darkGrey),
                      ],
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          data: 'PHONE NUMBER:',
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.center,
                        ),
                        MyTextField(
                            controller: phoneNumberController,
                            hintText: 'hintText',
                            obscureText: false,
                            width: 150,
                            radius: 20,
                            backColor: lightGreen,
                            borderColor: darkGrey),
                      ],
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          data: 'ASSIGNED ROOM:',
                          color: darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.center,
                        ),
                        MyTextField(
                            controller: wardController,
                            hintText: 'hintText',
                            obscureText: false,
                            width: 190,
                            radius: 20,
                            backColor: lightGreen,
                            borderColor: darkGrey),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          title: 'Cancel',
                          width: 140,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MyButton(
                          title: 'Submit',
                          width: 140,
                          onPressed: () {
                            updatePatientsData(
                              snapshot.data![index]['_id'],
                              weightController.text,
                              reportController.text,
                              addressController.text,
                              phoneNumberController.text,
                              wardController.text,
                            );
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TextWidget extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  const TextWidget(
      {super.key,
      required this.data,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
