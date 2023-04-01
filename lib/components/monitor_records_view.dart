class Patient {
  final String patientId;
  final String firstName;
  final String lastName;
  final String gender;
  final String report;
  final String createdAt;

  Patient({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.report,
    required this.createdAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patientId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      report: json['report'],
      createdAt: json['createdAt'],
    );
  }
}