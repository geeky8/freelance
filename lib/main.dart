import 'package:flutter/material.dart';
import 'package:freelance/login_screen.dart';
import 'package:freelance/store/detail_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        Provider(
          create: (_) => DetailStore(),
        ),
      ], child: const LoginScreen()),
    );
  }
}
