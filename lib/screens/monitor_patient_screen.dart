import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';
import 'package:centennial_care/components/patient_data_api.dart';

class MonitorPatient extends StatefulWidget {
  const MonitorPatient({super.key});

  @override
  State<MonitorPatient> createState() => _MonitorPatientState();
}

class _MonitorPatientState extends State<MonitorPatient> {
  late Future<List<dynamic>> _futurePatientData;
  late Future<List<dynamic>> _futureTestData;
  late final String id;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This is called whenever the dependencies of this widget change.
    // In this case, we use it to obtain the patientId from the ModalRoute.
    setState(() {
      id = (ModalRoute.of(context)!.settings.arguments as String?)!;
      _futurePatientData = monitorPatientData(patientId: id);
      _futureTestData = fetchTestRecords(patientId: id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          "MONITOR PATIENT",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'PATIENT INFORMATION:',
                        style: TextStyle(
                          fontSize: 31,
                          color: darkGrey,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 300,
                      child: FutureBuilder<List<dynamic>>(
                          future: _futurePatientData,
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data!;
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 5),
                                    child: Card(
                                      color: darkGreen,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: darkGrey, width: 0.9),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 600,
                                            height: 240,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'PATIENT - ${data[index]['patientId']}',
                                                    style: const TextStyle(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${data[index]['firstName']} ${data[index]['lastName']}',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'AGE: ${data[index]['age']} / ${data[index]['gender']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'WEIGHT: ${data[index]['weight']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'REPORT: ${data[index]['report']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'ASSIGNED ROOM: ${data[index]['ward']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'ADDMITED ON: ${data[index]['createdAt']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'LAST UPDATED: ${data[index]['updatedAt']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          })),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'TEST RECORDS:',
                        style: TextStyle(
                          fontSize: 31,
                          color: darkGrey,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 300,
                      child: FutureBuilder<List<dynamic>>(
                          future: _futureTestData,
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data!;
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 5),
                                    child: Card(
                                      color: darkGreen,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: darkGrey, width: 0.9),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 600,
                                            height: 170,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'NURSE: ${data[index]['nurseName']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'BLOOD PRESSURE: ${data[index]['systolic']} / ${data[index]['diastolic']} mm HG',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'RESPIRATORY RATE: ${data[index]['respiratoryRate']} breaths/min',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'BLOOD OXYGEN LEVEL: ${data[index]['bloodOxygenLevel']} mm HG',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'HEARTBEAT RATE: ${data[index]['heartBeatRate']} beats/min',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'ADDED ON: ${data[index]['createdAt']}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkGrey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          })),
                    ),
                  ),
                  ElevatedButton(onPressed: null, child: Text('ADD'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
