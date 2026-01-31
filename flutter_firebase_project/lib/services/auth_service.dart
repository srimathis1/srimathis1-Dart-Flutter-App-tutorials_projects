import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SIGN UP WITH ROLE
  Future<void> signUp(
    String email,
    String password,
    String role,
  ) async {
    UserCredential userCred =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection('users')
        .doc(userCred.user!.uid)
        .set({
      'email': email,
      'role': role,
    });
  }

  // GET USER ROLE
  Future<String> getUserRole(String uid) async {
    final doc =
        await _firestore.collection('users').doc(uid).get();
    return doc['role'];
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }
}
