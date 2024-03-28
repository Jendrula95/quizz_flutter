import 'package:flutter/material.dart';
import 'package:quizz_flutter/data/question.dart';
import 'package:quizz_flutter/start_screen.dart'; // Importuj StartScreen

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, String?> selectedAnswers;
  final int correctAnswersCount;
  final VoidCallback restartQuiz; // Dodajemy funkcję restartu

  const ResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.correctAnswersCount,
    required this.restartQuiz, // Przekazujemy funkcję restartu
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Column(
        children: [
          Text('Correct Answers: $correctAnswersCount / ${questions.length}'),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: selectedAnswers.length,
              itemBuilder: (context, index) {
                final questionIndex = selectedAnswers.keys.toList()[index];
                final question = questions[questionIndex];
                final selectedAnswer = selectedAnswers[questionIndex];
                return ListTile(
                  title: Text(question.question),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Selected Answer: ${selectedAnswer ?? "Not selected"}'),
                      Text('Correct Answer: ${question.correctAnswer}'),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: restartQuiz, // Wywołujemy funkcję restartu
            child: const Text('Restart Quiz'), // Przycisk restartu
          ),
        ],
      ),
    );
  }
}
