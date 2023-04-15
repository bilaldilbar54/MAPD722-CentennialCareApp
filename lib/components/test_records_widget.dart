import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class TestRecordWidget extends StatelessWidget {
  const TestRecordWidget({
    Key? key,
    required Future<List> futureTestData,
  })  : _futureTestData = futureTestData,
        super(key: key);

  final Future<List> _futureTestData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _futureTestData,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              bool isCritical = false;
              if (int.parse(data[index]['systolic']) >= 140 ||
                  int.parse(data[index]['diastolic']) >= 90) {
                isCritical = true;
              } else if (int.parse(data[index]['heartBeatRate']) <= 65 ||
                  int.parse(data[index]['heartBeatRate']) >= 85) {
                isCritical = true;
              } else if (int.parse(data[index]['respiratoryRate']) <= 12 ||
                  int.parse(data[index]['respiratoryRate']) >= 25) {
                isCritical = true;
              } else if (int.parse(data[index]['bloodOxygenLevel']) <= 90) {
                isCritical = true;
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Card(
                  color: isCritical ? Colors.red : darkGreen,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: darkGrey, width: 0.9),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 600,
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'NURSE: ${data[index]['nurseName']}',
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
                                'BLOOD PRESSURE: ${data[index]['systolic']} / ${data[index]['diastolic']} mm HG',
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
                                'RESPIRATORY RATE: ${data[index]['respiratoryRate']} breaths/min',
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
                                'BLOOD OXYGEN LEVEL: ${data[index]['bloodOxygenLevel']} mm HG',
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
                                'HEARTBEAT RATE: ${data[index]['heartBeatRate']} beats/min',
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
                                'ADDED ON: ${data[index]['createdAt']}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
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
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(darkGreen),
          strokeWidth: 5,
        );
      }),
    );
  }
}
