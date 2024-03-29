import 'package:flutter/material.dart';

//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//domain

final mainProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser = null;
  void setCurreentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}
