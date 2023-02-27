import 'package:centennial_care/components/custom_search_textfield.dart';
import 'package:centennial_care/components/patients_list_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:centennial_care/colors.dart';

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000/patients'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, parse the JSON
    final data = json.decode(response.body);
    return data;
  } else {
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to fetch data');
  }
}

class ViewPatients extends StatefulWidget {
  const ViewPatients({super.key});

  @override
  State<ViewPatients> createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  late Future<List<dynamic>> _futureData;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'VIEW PATIENTS',
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
              )),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20),
                  child: Text(
                    'FIND A PATIENT:',
                    style: TextStyle(
                      fontSize: 31,
                      color: darkGrey,
                    ),
                  ),
                ),
              ),
              const SearchTextFieldClass(),
              PatientListView(futureData: _futureData),
            ],
          ),
        ),
      ),
    );
  }
}
