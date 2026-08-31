import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_code_scanner/data/models/datafetch/test_result_model.dart';

class TestResultRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static String normalizeClassId(String value) {
    final trimmed = value.trim();
    final match = RegExp(r'^(?:grade|class)\s+(.+)$', caseSensitive: false)
        .firstMatch(trimmed);
    return (match?.group(1) ?? trimmed).trim();
  }


  Future<List<TestResultModel>> getStudentResults({
  required String classId,
  required String rollNo,
}) async {
  final normalizedClassId = normalizeClassId(classId);
  final normalizedRollNo = rollNo.trim();
  print('[TEST_FETCH] classId=$normalizedClassId rollNo=$normalizedRollNo');
  final snapshot = await _firestore
      .collection('testResults')
      .where('classId', isEqualTo: normalizedClassId)
      .get();
  print('[TEST_FETCH] docsReturned=${snapshot.docs.length}');

  final results = <TestResultModel>[];

  for (final doc in snapshot.docs) {
    final data = doc.data();
    final scores = Map<String, dynamic>.from(data['scores'] ?? {});

    final scoreKeyFound = scores.containsKey(normalizedRollNo);
    final marks = scores[normalizedRollNo];
    print('[TEST_FETCH] testId=${doc.id} scoreKeyFound=$scoreKeyFound marks=$marks');
    if (!scoreKeyFound) continue;

    results.add(
      TestResultModel.fromDoc(
        doc: doc,
        studentKey: normalizedRollNo,
      ),
    );
  }

  results.sort((a, b) => b.testDate.compareTo(a.testDate));
  print('[TEST_FETCH] resultsLoaded=${results.length}');
  return results;
}



Future<List<TestResultModel>> getClassResults({
  required String classId,
}) async {
  final normalizedClassId = normalizeClassId(classId);
  final snapshot = await _firestore
      .collection('testResults')
      .where('classId', isEqualTo: normalizedClassId)
      .get();

  final results = <TestResultModel>[];

  for (final doc in snapshot.docs) {
    final data = doc.data();
    final scores = Map<String, dynamic>.from(data['scores'] ?? {});

    for (final rollNo in scores.keys) {
      results.add(
        TestResultModel.fromDoc(
          doc: doc,
          studentKey: rollNo.trim(),
        ),
      );
    }
  }

  results.sort((a, b) => b.testDate.compareTo(a.testDate));

  return results;
}


}
