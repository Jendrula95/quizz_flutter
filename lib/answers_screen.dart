import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Przykładowe pytania, poprawne odpowiedzi i odpowiedzi użytkownika
    List<Map<String, dynamic>> questionsAndAnswers = [
      {
        'question': 'Pytanie 1',
        'correctAnswer': 'Odpowiedź 1',
        'userAnswer': 'Odpowiedź użytkownika 1',
      },
      {
        'question': 'Pytanie 2',
        'correctAnswer': 'Odpowiedź 2',
        'userAnswer': 'Odpowiedź użytkownika 2',
      },
      {
        'question': 'Pytanie 3',
        'correctAnswer': 'Odpowiedź 3',
        'userAnswer': 'Odpowiedź użytkownika 3',
      },
      // Tutaj można dodać więcej pytań i odpowiedzi
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Poprawna odpowiedź: ${questionsAndAnswers[index]['correctAnswer']}',
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Odpowiedź użytkownika: ${questionsAndAnswers[index]['userAnswer']}',
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
