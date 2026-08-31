import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_code_scanner/data/models/datafetch/student_model.dart';

class StudentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StudentModel?> getCurrentStudent() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final byUid = await _firestore.collection('students').doc(user.uid).get();
    if (byUid.exists && byUid.data() != null) {
      return StudentModel.fromMap(byUid.data()!);
    }

    // Legacy fallback for existing accounts whose profile was not created
    // with the Auth UID as its document ID.
    return getStudentByEmail(user.email ?? '');
  }

  Future<StudentModel?> getStudentByEmail(String email) async {
    final query = await _firestore
        .collection('students')
        .where('email', isEqualTo: email.trim())
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      return null;
    }

    return StudentModel.fromMap(query.docs.first.data());
  }
}
