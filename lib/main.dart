import 'package:flutter/material.dart';
import 'package:quizz_flutter/result_screen.dart';
import 'package:quizz_flutter/quiz_screen.dart';
import 'package:quizz_flutter/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResultScreen(),
    );
  }
}
