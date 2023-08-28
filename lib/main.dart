import 'package:flutter/material.dart';
//models
import 'package:flutter_app_sns01/models/main_model.dart';
//packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_sns01/views/login_page.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);

    String title = 'Flutter アプリケーション ';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: mainModel.currentUser == null
          ? LoginPage(
              mainModel: mainModel,
            )
          : MyHomePage(
              title: title,
              mainModel: mainModel,
            ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required this.mainModel});

  final String title;
  final MainModel mainModel;
  @override
  Widget build(
    BuildContext context,
  ) {
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
              routes.toLoginPage(context: context, mainModel: mainModel);
            },
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
