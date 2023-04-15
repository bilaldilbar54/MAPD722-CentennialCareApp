import 'package:centennial_care/components/patient_data_api.dart';
import 'package:centennial_care/components/patient_info_widget.dart';
import 'package:centennial_care/components/test_records_widget.dart';
import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class MonitorPatientWidget extends StatefulWidget {
  const MonitorPatientWidget({super.key});

  @override
  State<MonitorPatientWidget> createState() => _MonitorPatientWidgetState();
}

class _MonitorPatientWidgetState extends State<MonitorPatientWidget> {
  late Future<List<dynamic>> _futurePatientData;
  late Future<List<dynamic>> _futureTestData;
  var newData;
  late final String id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      id = (ModalRoute.of(context)!.settings.arguments as String?)!;
      _futurePatientData = monitorPatientData(patientId: id);
      _futureTestData = fetchTestRecords(patientId: id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          newData = snapshot.data!;
                          return PatientInfoWidget(data: newData);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(darkGreen),
                          strokeWidth: 5,
                        );
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
                  height: 330,
                  child: RefreshIndicator(
                    backgroundColor: darkGrey,
                    color: darkGreen,
                    onRefresh: () async {
                      setState(() {
                        _futureTestData = fetchTestRecords(patientId: id);
                      });
                    },
                    child: TestRecordWidget(futureTestData: _futureTestData),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/addTest', arguments: newData)
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(darkGreen),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                child: const Text(
                  'ADD TEST',
                  style: TextStyle(
                    color: darkGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
