import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static String verificationId = '';
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;
  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'user not found !';
      }
      if (e.code == 'wrong-password') {
        return 'Incorrect password provided !';
      }

      return '';
    }
  }

  Future<String> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      return '';
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    }
  }
}
