import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class CriticalPatient {
  final String name;
  final String nurse;
  final String bPressure;
  final String rRate;
  final String boLevel;
  final String hBrate;
  final String status;
  final String ward;

  CriticalPatient(
      {required this.name,
      required this.nurse,
      required this.bPressure,
      required this.rRate,
      required this.boLevel,
      required this.hBrate,
      required this.status,
      required this.ward});
}

List<CriticalPatient> criticalRecords = [
  CriticalPatient(
    name: 'NAME: James Taylor',
    nurse: 'NURSE: Chris',
    bPressure: 'BLOOD PRESSURE: 80 / 145mm HG',
    rRate: 'RESPIRATORY RATE: 20 breaths/min',
    boLevel: 'BLOOD OXYGEN LEVEL: 98mm HG',
    hBrate: 'HEARTBEAT RATE: 80 beats/min',
    status: 'STATUS: CRITICAL',
    ward: 'WARD: WARD B - Room: B205',
  ),
  CriticalPatient(
    name: 'NAME: Alan Donald',
    nurse: 'NURSE: Chris',
    bPressure: 'BLOOD PRESSURE: 80 / 120mm HG',
    rRate: 'RESPIRATORY RATE: 18 breaths/min',
    boLevel: 'BLOOD OXYGEN LEVEL: 98mm HG',
    hBrate: 'HEARTBEAT RATE: 72 beats/min',
    status: 'STATUS: CRITICAL',
    ward: 'WARD: WARD A - Room: A110',
  ),
  CriticalPatient(
    name: 'NAME: Bill Clinton',
    nurse: 'NURSE: Mike',
    bPressure: 'BLOOD PRESSURE: 85 / 135mm HG',
    rRate: 'RESPIRATORY RATE: 19 breaths/min',
    boLevel: 'BLOOD OXYGEN LEVEL: 95mm HG',
    hBrate: 'HEARTBEAT RATE: 79 beats/min',
    status: 'STATUS: CRITICAL',
    ward: 'WARD: WARD A - Room: A125',
  ),
  CriticalPatient(
    name: 'NAME: Surya Kumar',
    nurse: 'NURSE: Nancy',
    bPressure: 'BLOOD PRESSURE: 80 / 150mm HG',
    rRate: 'RESPIRATORY RATE: 11 breaths/min',
    boLevel: 'BLOOD OXYGEN LEVEL: 97mm HG',
    hBrate: 'HEARTBEAT RATE: 80 beats/min',
    status: 'STATUS: CRITICAL',
    ward: 'WARD: WARD A - Room: A301',
  ),
  CriticalPatient(
    name: 'NAME: Ali Hassan',
    nurse: 'NURSE: Mike',
    bPressure: 'BLOOD PRESSURE: 90 / 120mm HG',
    rRate: 'RESPIRATORY RATE: 17 breaths/min',
    boLevel: 'BLOOD OXYGEN LEVEL: 92mm HG',
    hBrate: 'HEARTBEAT RATE: 75 beats/min',
    status: 'STATUS: CRITICAL',
    ward: 'WARD: WARD A - Room: D421',
  ),
];

class CriticalPatients extends StatelessWidget {
  const CriticalPatients({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    'FOLLOWING PATIENTS NEEDS ATTENTION:',
                    style: TextStyle(
                      fontSize: 18,
                      color: darkGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                        height: 684,
                        child: ListView.builder(
                          itemCount: criticalRecords.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '------------------------------------------------------',
                                    style: TextStyle(color: darkGrey),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    criticalRecords[index].name,
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
                                    criticalRecords[index].nurse,
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
                                    criticalRecords[index].bPressure,
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
                                    criticalRecords[index].rRate,
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
                                    criticalRecords[index].boLevel,
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
                                    criticalRecords[index].hBrate,
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
                                    criticalRecords[index].status,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    criticalRecords[index].ward,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: darkGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    '------------------------------------------------------',
                                    style: TextStyle(
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
        ),
      ),
    );
  }
}
