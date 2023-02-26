import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({
    Key? key,
    required Future<List> futureData,
  })  : _futureData = futureData,
        super(key: key);

  final Future<List> _futureData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<dynamic>>(
          future: _futureData,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Card(
                        //child: Text(snapshot.data![index]['firstName']),
                        color: darkGreen,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: darkGrey, width: 0.9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                data:
                                    'PATIENT ID: ${snapshot.data![index]['patientId']}',
                                color: darkGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
                                  ),
                                  const SizedBox(width: 2),
                                  TextWidget(
                                    data: snapshot.data![index]['lastName'],
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data: 'AGE: ${snapshot.data![index]['age']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'WEIGHT: ${snapshot.data![index]['weight']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'ADDRESS: ${snapshot.data![index]['address']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'PHONE NUMBER: ${snapshot.data![index]['phoneNumber']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'DATE OF BIRTH: ${snapshot.data![index]['dateOfBirth']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'REPORT: ${snapshot.data![index]['report']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'DOCTOR: ${snapshot.data![index]['doctor']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'ASSIGNED: ${snapshot.data![index]['ward']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'ADMITTED ON: ${snapshot.data![index]['createdAt']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              TextWidget(
                                data:
                                    'LAST UPDATED: ${snapshot.data![index]['updatedAt']}',
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          })),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const TextWidget({
    super.key,
    required this.data,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
