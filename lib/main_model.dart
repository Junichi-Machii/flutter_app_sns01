import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final mainProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0;

  Future<void> createUser({required BuildContext context}) async {
    counter++;
    var uuid = Uuid();
    final String v4 = uuid.v4();
    final Map<String, dynamic> userData = {
      "userName": 'junior',
      "uid": v4,
    };
    await FirebaseFirestore.instance.collection('users').doc(v4).set(userData);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('user added')));
    notifyListeners();
  }
}
