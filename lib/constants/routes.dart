import 'package:flutter/material.dart';
import 'package:flutter_app_sns01/views/signup_page.dart';
import 'package:flutter_app_sns01/views/login_page.dart';

void toSignUpPage({required BuildContext context}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
void toLoginPage({required BuildContext context}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
