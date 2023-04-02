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
    return data;
    // If the server did not return a 200 OK response, throw an error.
    //throw Exception('Failed to fetch data');
  }
}

updatePatientsData(String patientId, String weight, String report,
    String address, String phoneNum, String ward) async {
  final patientData = {
    'weight': weight,
    'report': report,
    'address': address,
    'phoneNumber': phoneNum,
    'ward': ward,
  };
  final response = await http.put(
    Uri.parse('http://127.0.0.1:5000/patients/$patientId'),
    body: patientData,
  );
  if (response.statusCode == 200) {
    // Data updated successfully
  } else {
    // Error updating data
  }
}

Future<void> addPatientRecord({
  required String patientId,
  required String firstName,
  required String lastName,
  required int age,
  required String gender,
  required String weight,
  required String report,
  required String address,
  required String phoneNumber,
  required String dateOfBirth,
  required String doctor,
  required String ward,
}) async {
  const String apiUrl = 'http://127.0.0.1:5000/patients';

  final Map<String, dynamic> data = {
    'patientId': patientId,
    'firstName': firstName,
    'lastName': lastName,
    'age': age,
    'gender': gender,
    'weight': weight,
    'report': report,
    'address': address,
    'phoneNumber': phoneNumber,
    'dateOfBirth': dateOfBirth,
    'doctor': doctor,
    'ward': ward,
  };

  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/patients'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 201) {
    print('Patient record added successfully.');
  } else {
    print('Error: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to add patient record.');
  }
}

Future<List<dynamic>> monitorPatientData({required String patientId}) async {
  var data = [];
  final response =
      await http.get(Uri.parse('http://127.0.0.1:5000/patients/$patientId'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, parse the JSON
    data = json.decode(response.body);
    return data;
  } else {
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to fetch data');
  }
}

Future<List<dynamic>> fetchTestRecords({required String patientId}) async {
  var data = [];
  final response = await http
      .get(Uri.parse('http://127.0.0.1:5000/patients/$patientId/tests'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, parse the JSON
    data = json.decode(response.body);
    return data;
  } else {
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to fetch data');
  }
}

// Future<List<dynamic>> fetchPatientsCriticalRecords() async {
//   var data = [];
//   final response =
//       await http.get(Uri.parse('http://127.0.0.1:5000/patients/tests'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response, parse the JSON
//     data = json.decode(response.body);
//     return data;
//   } else {
//     // If the server did not return a 200 OK response, throw an error.
//     throw Exception('Failed to fetch data');
//   }
// }

Future<List<dynamic>> fetchPatientsCriticalRecords() async {
  const apiUrl = 'http://127.0.0.1:5000/patients/tests?sort=-createdAt';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final records = json.decode(response.body);
    final groupedRecords = _groupByPatientId(records);
    final latestRecords = _getLatestRecords(groupedRecords);
    return latestRecords;
  } else {
    throw Exception('Failed to fetch data');
  }
}

Map<String, List<dynamic>> _groupByPatientId(List<dynamic> records) {
  final groupedRecords = <String, List<dynamic>>{};
  for (final record in records) {
    final patientId = record['patientId'];
    if (!groupedRecords.containsKey(patientId)) {
      groupedRecords[patientId] = [];
    }
    groupedRecords[patientId]?.add(record);
  }
  return groupedRecords;
}

List<dynamic> _getLatestRecords(Map<String, List<dynamic>> groupedRecords) {
  final latestRecords = [];
  for (final patientId in groupedRecords.keys) {
    final patientRecords = groupedRecords[patientId];
    patientRecords?.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));
    latestRecords.add(patientRecords?.first);
  }
  return latestRecords;
}
