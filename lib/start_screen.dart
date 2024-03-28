import 'dart:math';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   "assets/images/quiz-logo.png",
          //   width: 300,
          //   color: const Color.fromARGB(104, 255, 255, 255),
          // ),
          const SizedBox(height: 80),
          const Text(
              style: TextStyle(color: Colors.white, fontSize: 24),
              'Kliknij aby rozpocząć!'),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Rozpocznij Gre'),
          )
        ],
      ),
    );
  }
}
