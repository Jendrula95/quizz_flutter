import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> questionsAndAnswers;

  const AnswerScreen({super.key, required this.questionsAndAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Odpowiedzi'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFC0D6B0), // Pastelowa zieleń
        ),
        child: ListView.builder(
          itemCount: questionsAndAnswers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pytanie ${index + 1}: ${questionsAndAnswers[index]['question']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Poprawna odpowiedź: ${questionsAndAnswers[index]['correctAnswer']}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Odpowiedź użytkownika: ${questionsAndAnswers[index]['userAnswer']}',
                        style: const TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context); // Powrót do poprzedniego ekranu (czyli ResultScreen)
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
