import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Question>> fetchQuestions() async {
  final response =
      await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> results = data['results'];
    List<Question> questions = [];

    for (var json in results) {
      List<String> allAnswers = List<String>.from(json['incorrect_answers']);
      allAnswers.add(json['correct_answer']);
      allAnswers.shuffle();

      Question question = Question(
        category: json['category'],
        question: json['question'],
        correctAnswer: json['correct_answer'],
        incorrectAnswers: allAnswers,
      );

      questions.add(question);
    }

    return questions;
  } else {
    throw Exception('Failed to load questions');
  }
}

class Question {
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }
}
