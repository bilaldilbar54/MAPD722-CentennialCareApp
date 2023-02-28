import 'package:centennial_care/components/patients_list_view.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';
import 'package:flutter/cupertino.dart';

class ViewPatients extends StatefulWidget {
  const ViewPatients({super.key});

  @override
  State<ViewPatients> createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  late Future<List<dynamic>> _futureData;
  final searchController = TextEditingController();
  String? _searchText;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData(query: _searchText);
    searchController.addListener(() {
      setState(() {
        _searchText = searchController.text;
        _futureData = fetchData(query: _searchText);
      });
    });
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
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
                    placeholder: 'Enter Patient Name',
                    backgroundColor: Colors.transparent,
                    controller: searchController,
                  ),
                ),
              ),
              PatientListView(futureData: _futureData),
            ],
          ),
        ),
      ),
    );
  }
}
