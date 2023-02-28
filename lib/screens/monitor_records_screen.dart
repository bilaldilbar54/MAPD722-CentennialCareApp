import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class Patient {
  final String id;
  final String name;
  final String age;
  final String weight;
  final String report;
  final String ward;
  final String admitttedAt;
  final String updatedAt;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.weight,
    required this.report,
    required this.ward,
    required this.admitttedAt,
    required this.updatedAt,
  });
}

class Test {
  final String nurse;
  final String bPressure;
  final String rRate;
  final String boLevel;
  final String hBrate;
  final String added;

  Test({
    required this.nurse,
    required this.bPressure,
    required this.rRate,
    required this.boLevel,
    required this.hBrate,
    required this.added,
  });
}

List<Patient> patientRecords = [
  Patient(
    id: 'PATIENT - 101103',
    name: 'Alan Donald',
    age: 'AGE: 50 / Male',
    weight: 'WEIGHT: 80',
    report: 'REPORT: Heart issue',
    ward: 'WARD: Ward B room 2',
    admitttedAt: 'ADMITTED ON: 2022-11-17T03:24:44.232',
    updatedAt: 'LAST UPDATED: 2022-11-17T03:24:44.232',
  ),
];

List<Test> patientTests = [
  Test(
    nurse: 'NURSE: Chris',
    bPressure: 'BLOOD PRESSURE: 80 / 120mm HG',
    rRate: 'RESPIRATORY RATE: 18 breaths/min',
    boLevel: 'BLOOD OXYGEN LEVEL: 98mm HG',
    hBrate: 'HEARTBEAT RATE: 72 beats/min',
    added: 'ADDED ON: 2022-12-05T00:11:59.346',
  ),
];

class MonitorRecords extends StatelessWidget {
  final searchController = TextEditingController();
  MonitorRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'MONITOR RECORDS',
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
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0),
                  child: Text(
                    'PATIENT RECORDS:',
                    style: TextStyle(
                      fontSize: 31,
                      color: darkGrey,
                    ),
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 22.0),
                    child: Text(
                      'ENTER PATIENT NAME:',
                      style: TextStyle(fontSize: 16, color: darkGrey),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: darkGreen,
                    border: Border.all(
                      color: darkGrey,
                      width: 0.9,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CupertinoSearchTextField(
                    placeholder: 'Alan Donald',
                    backgroundColor: Colors.transparent,
                    controller: searchController,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Card(
                  color: darkGreen,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: darkGrey, width: 0.9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 600,
                        height: 220,
                        child: ListView.builder(
                          itemCount: patientRecords.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    patientRecords[index].id,
                                    style: const TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].age,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].weight,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].report,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].ward,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].admitttedAt,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    patientRecords[index].updatedAt,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 20.0),
                      child: Text(
                        'TEST RECORDS:',
                        style: TextStyle(
                          fontSize: 31,
                          color: darkGrey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Card(
                      color: darkGreen,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: darkGrey, width: 0.9),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 600,
                            height: 170,
                            child: ListView.builder(
                              itemCount: patientTests.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        patientTests[index].nurse,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: darkGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        patientTests[index].bPressure,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: darkGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        patientTests[index].rRate,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: darkGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        patientTests[index].boLevel,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: darkGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        patientTests[index].hBrate,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: darkGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        patientTests[index].added,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: darkGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const MyButton(
                title: 'ADD TESTS',
                onTap: 'addTest',
                width: 180,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
