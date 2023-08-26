import 'package:flutter/material.dart';
//models
import 'package:flutter_app_sns01/main_model.dart';
//packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//options
import 'firebase_options.dart';

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
    final TextEditingController emailEditingController =
        TextEditingController(text: mainModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: mainModel.password);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => mainModel.email = text,
            controller: emailEditingController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => mainModel.password = text,
            controller: passwordEditingController,
            obscureText: mainModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                child: mainModel.isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onTap: () => mainModel.toggleObscure(),
              ),
            ),
          ),
          Center(
            child: mainModel.currentUser == null
                ? Text("null")
                : Text('not null '),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await mainModel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
