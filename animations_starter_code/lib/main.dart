import 'package:animation_starter_code/explicit_examples/login_animation.dart';
import 'package:flutter/material.dart';

// vid at 01:15:14
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreenAnimation(),
    );
  }
}