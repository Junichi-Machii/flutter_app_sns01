import 'package:flutter/material.dart';
//models
import 'package:flutter_app_sns01/models/main_model.dart';
//packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//options
import 'firebase_options.dart';

// constants
import 'package:flutter_app_sns01/constants/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title = 'Flutter アプリケーション ';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              routes.toSignUpPage(context: context);
            },
            child: const Text('Sign Up'),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () {
              routes.toLoginPage(context: context);
            },
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: mainModel.currentUser == null
                ? Text("null")
                : Text('not null '),
          ),
        ],
      ),
    );
  }
}
