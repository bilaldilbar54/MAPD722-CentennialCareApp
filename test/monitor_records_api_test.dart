import 'package:centennial_care/components/patient_data_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('monitorPatientData returns a list of data for a valid patient ID',
      () async {
    // Arrange
    final expectedData = [
      {
        "_id": "6375aec3d647c80016162b5b",
        "patientId": "101107",
        "firstName": "Donald",
        "lastName": "Duck",
        "age": "65",
        "gender": "male",
        "weight": "140",
        "address": "1 Kennedy st.",
        "phoneNumber": "647-123-7854",
        "dateOfBirth": "10/04/1957",
        "report": "Heart issues",
        "doctor": "Chris",
        "ward": "Ward B room 2",
        "createdAt": "2022-11-17T03:47:15.498Z",
        "updatedAt": "2023-04-03T02:02:38.531Z",
        "__v": 0
      }
      // {
      //   'weight': '67',
      //   'report': 'Excellent',
      //   'address': '456 Oak Ave',
      //   'phoneNumber': '555-555-1234',
      //   'ward': 'B'
      // }
    ];

    // Act
    final actualData =
        await monitorPatientData(patientId: '6375aec3d647c80016162b5b');

    // Assert
    expect(actualData, equals(expectedData));
  });

  test('monitorPatientData throws an exception for an invalid patient ID',
      () async {
    // Arrange
    const invalidPatientId = 'invalid_id';

    // Act
    final future = monitorPatientData(patientId: invalidPatientId);

    // Assert
    expect(future, throwsException);
  });
}
