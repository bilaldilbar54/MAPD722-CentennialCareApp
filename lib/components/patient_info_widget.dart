import 'package:flutter/material.dart';
import 'package:centennial_care/colors.dart';

class PatientInfoWidget extends StatelessWidget {
  const PatientInfoWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
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
            child: Column(
              children: [
                SizedBox(
                  width: 600,
                  height: 240,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'PATIENT - ${data[index]['patientId']}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
  }
}
