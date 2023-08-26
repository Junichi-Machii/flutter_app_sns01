import 'package:flutter/material.dart';

//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginModel());

class LoginModel extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isObscure = true;
  User? currentUser = null;

  Future<void> login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      currentUser = FirebaseAuth.instance.currentUser;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
