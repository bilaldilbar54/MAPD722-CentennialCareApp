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

updatePatientsData(String patientId, String weight, String report, String address,
    String phoneNum, String ward) async {
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
