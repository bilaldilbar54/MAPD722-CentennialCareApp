import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:centennial_care/components/custom_rect_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class Patient {
  final String firstName;
  final String lastName;
  final String address;
  final String age;
  final String gender;
  final String createdAt;
  final String updatedAt;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.age,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      age: json['age'],
      gender: json['gender'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class MonitorRecords extends StatefulWidget {
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 600,
                    height: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${_patients[index].firstName} ${_patients[index].lastName}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        Text(
                          'Address: ${_patients[index].address}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        Text(
                          'Age: ${_patients[index].age}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        Text(
                          'Gender: ${_patients[index].gender}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        Text(
                          'Created at: ${_patients[index].createdAt}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
                        Text(
                          'Updated at: ${_patients[index].updatedAt}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                        ),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
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
                placeholder: 'Enter Patient Name',
                backgroundColor: Colors.transparent,
                controller: _filter,
              ),
            ),
          ),
          Expanded(child: _buildPatientList()),
        ],
      ),
    );
  }
}
