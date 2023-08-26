import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//models
import 'package:flutter_app_sns01/models/signup_model.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignUpModel signUpModel = ref.watch(signUpProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: signUpModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: signUpModel.password);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign Up'),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signUpModel.email = text,
            controller: emailEditingController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => signUpModel.password = text,
            controller: passwordEditingController,
            obscureText: signUpModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                child: signUpModel.isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onTap: () => signUpModel.toggleObscure(),
              ),
            ),
          ),
          Center(
            child: signUpModel.currentUser == null
                ? Text("null")
                : Text('not null '),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await signUpModel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
