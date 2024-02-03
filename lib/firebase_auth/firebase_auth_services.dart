import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_project/firebase_auth/toast.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Store user data in Firestore after successful sign-up
      await storeUserData(credential.user!.uid, email, password); // Pass 'password' to storeUserData

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<void> storeUserData(String userId, String email, String password) async {
    try {
      // Reference to the users collection
      CollectionReference users = _firestore.collection('users');
      // Add user data to Firestore
      await users.doc(userId).set({
        'email': email,
        'password': password,

      });
    } catch (e) {
      print('Error storing user data: $e');
      // Handle error as needed
    }
  }
}
