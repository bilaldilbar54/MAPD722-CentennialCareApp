import 'dart:convert';
import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:centennial_care/colors.dart';

class Patient {
  final String patientId;
  final String firstName;
  final String lastName;
  final String gender;
  final String report;
  final String createdAt;

  Patient({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.report,
    required this.createdAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patientId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      report: json['report'],
      createdAt: json['createdAt'],
    );
  }
}

class MonitorRecords extends StatefulWidget {
  const MonitorRecords({super.key});

  @override
  _MonitorRecordsState createState() => _MonitorRecordsState();
}

class _MonitorRecordsState extends State<MonitorRecords> {
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  List<Patient> _patients = [];

  _MonitorRecordsState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _patients.clear();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
          _fetchPatients();
        });
      }
    });
  }

  Future<List<Patient>> _fetchPatients() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:5000/patients'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Patient> patients =
          body.map((dynamic item) => Patient.fromJson(item)).toList();
      setState(() {
        _patients = patients;
      });
      return patients;
    } else {
      throw Exception('Failed to fetch patients');
    }
  }

  Widget _buildPatientList() {
    if (_searchText.isNotEmpty) {
      List<Patient> tempList = [];
      for (int i = 0; i < _patients.length; i++) {
        if (_patients[i]
            .firstName
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(_patients[i]);
        }
      }
      _patients = tempList;
    }

    return ListView.builder(
      itemCount: _patients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Card(
            color: darkGreen,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: darkGrey, width: 0.9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 600,
                    height: 226,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PATIENT - ${_patients[index].patientId}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${_patients[index].firstName} ${_patients[index].lastName}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'GENDER: ${_patients[index].gender}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'REPORT: ${_patients[index].report}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'ADDMITED ON: ${_patients[index].createdAt}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        Center(
                          child: MyButton(
                              title: "MONITOR PATIENT →",
                              width: 220,
                              onPressed: () => {
                                    Navigator.pushNamed(
                                        context, '/monitorPatient')
                                  }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          "MONITOR RECORDS",
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 170, 5),
                child: Column(
                  children: const [
                    Text(
                      'ENTER PATIENT NAME:',
                      style: TextStyle(
                        fontSize: 21,
                        color: darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
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
                    placeholder: 'Richard Louis',
                    backgroundColor: Colors.transparent,
                    controller: _filter,
                  ),
                ),
              ),
              Expanded(child: _buildPatientList()),
            ],
          ),
        ),
      ),
    );
  }
}
