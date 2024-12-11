import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnly/Utils.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error signing up: $e");
      Get.snackbar('Error Signing up', e.toString());
      return null;
    }
  }

Future<User?> signIn(String email, String password) async {
  
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
  
    print("Error signing in: $e");
    Get.snackbar('Error signing in',e.toString(),backgroundColor: Colors.grey);
    return null;
  }
}
Future<void> signOut() async {
  await _auth.signOut();
  print("User signed out");
}
}