import 'package:flutter/material.dart';
import 'package:flutter_app_sns01/main.dart';
import 'package:flutter_app_sns01/models/main_model.dart';
import 'package:flutter_app_sns01/views/signup_page.dart';
import 'package:flutter_app_sns01/views/login_page.dart';

void toMyApp({required BuildContext context}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
void toSignUpPage({required BuildContext context}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
void toLoginPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          mainModel: mainModel,
        ),
      ),
    );
