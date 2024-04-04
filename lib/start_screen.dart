import 'package:flutter/material.dart';
import 'package:quizz_flutter/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC0D6B0),
              Color(0xFF84A98C),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                width: 300,
                color: const Color.fromARGB(0, 255, 255, 255),
              ),
              const SizedBox(height: 80),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()));
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Rozpocznij Gre'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
