import 'package:centennial_care/components/patient_data_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fetchData', () {
    test('returns a list of patients', () async {
      final patients = await fetchData();
      expect(patients, isA<List>());
    });

    test('filters results by query string', () async {
      final patients = await fetchData(query: 'john');
      expect(patients.every((p) => p.toString().toLowerCase().contains('john')),
          isTrue);
    });
  });
}
