import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiUrl = 'http://127.0.0.1:5000/patients';

Future<List<dynamic>> fetchData({String? query}) async {
  var data = [];
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, parse the JSON
    data = json.decode(response.body);
    if (query != null) {
      data = data
          .where((item) =>
              item['firstName']
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase()) ||
              item['lastName']
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase()))
          .toList();
    }
    return data;
  } else {
    //return data;
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to fetch data');
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
    Uri.parse('$apiUrl/$patientId'),
    body: patientData,
  );
  if (response.statusCode == 200) {
    // Data updated successfully
  } else {
    // Error updating data
  }
}

Future addPatientRecord({
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
    Uri.parse(apiUrl),
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
  final response = await http.get(Uri.parse('$apiUrl/$patientId'));

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
  final response = await http.get(Uri.parse('$apiUrl/$patientId/tests'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, parse the JSON
    List<dynamic> data = json.decode(response.body);
    // Sort the records in descending order based on the "timestamp" field
    data.sort((a, b) => b["createdAt"].compareTo(a["createdAt"]));
    return data;
  } else {
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to fetch data');
  }
}

Future<List<dynamic>> fetchPatientsCriticalRecords() async {
  final response = await http.get(Uri.parse('$apiUrl/tests?sort=-createdAt'));
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
    // latestRecords.add(patientRecords?.first);

    final latestRecord = patientRecords?.first;
    if (latestRecord != null &&
        ((int.parse(latestRecord['systolic']) >= 140 &&
                int.parse(latestRecord['diastolic']) >= 90) ||
            (int.parse(latestRecord['respiratoryRate']) <= 12 ||
                int.parse(latestRecord['respiratoryRate']) >= 25) ||
            (int.parse(latestRecord['bloodOxygenLevel']) <= 90) ||
            (int.parse(latestRecord['heartBeatRate']) <= 65 ||
                int.parse(latestRecord['heartBeatRate']) >= 85))) {
      latestRecords.add(latestRecord);
    }
  }
  return latestRecords;
}

Future<void> postTestData(
    String patientId,
    String firstName,
    String lastName,
    String ward,
    String nurseName,
    String diastolic,
    String systolic,
    String respiratoryRate,
    String bloodOxygenLevel,
    String heartBeatRate) async {
  var data = {
    'firstName': firstName,
    'lastName': lastName,
    'ward': ward,
    'nurseName': nurseName,
    'diastolic': diastolic,
    'systolic': systolic,
    'respiratoryRate': respiratoryRate,
    'bloodOxygenLevel': bloodOxygenLevel,
    'heartBeatRate': heartBeatRate,
  };

  var response =
      await http.post(Uri.parse('$apiUrl/$patientId/tests'), body: data);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var responseData = jsonDecode(response.body);
    print(responseData['message']);
  } else {
    print('Post request failed with status: ${response.statusCode}.');
  }
}
