import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchData({String? query}) async {
  var data = [];
  final response = await http.get(Uri.parse('http://127.0.0.1:5000/patients'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, parse the JSON
    data = json.decode(response.body);
    return Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        if (query != null) {
          data = data
              .where((data) => data
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase()))
              .toList();
        }
        return data;
      },
    );
  } else {
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to fetch data');
  }
}

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
                    ),
                  );
                }));
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
