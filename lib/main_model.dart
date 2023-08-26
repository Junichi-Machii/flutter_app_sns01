import 'package:flutter/material.dart';

//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//domain
import 'package:flutter_app_sns01/domain/firestore_users/firestore_user.dart';

final mainProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser = null;

  String email = '';
  String password = '';

  Future<void> createFirestoreUser(
      {required BuildContext context, required String uid}) async {
    counter++;

    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      uid: uid,
      createsAt: now,
      updateAt: now,
      userName: "test",
      email: email,
    );
    final Map<String, dynamic> userData = firestoreUser.toJson();
    await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('user added')));
    notifyListeners();
  }

  Future<void> createUser({required BuildContext context}) async {
    //firebase auth
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}
