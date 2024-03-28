import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizz_flutter/data/question.dart';
import 'package:quizz_flutter/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key,
      required this.fetchQuestions,
      required void Function() restartQuiz});

  final Future<List<Question>> Function() fetchQuestions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Future<List<Question>> futureQuestions;
  late List<Question> questions;
  int currentQuestionIndex = 0;
  Map<int, String?> selectedAnswers =
      {}; // Mapa do przechowywania wybranych odpowiedzi
  int correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    futureQuestions = widget.fetchQuestions();
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Po osiągnięciu ostatniego pytania, przenieś użytkownika do ekranu wyników
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              questions: questions,
              selectedAnswers: selectedAnswers,
              correctAnswersCount: correctAnswersCount,
              restartQuiz: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ),
        );
      }
    });
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;

      if (answer == questions[currentQuestionIndex].correctAnswer) {
        correctAnswersCount++; // Zwiększ liczbę poprawnych odpowiedzi
      }
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      nextQuestion(); // Przejdź do następnego pytania po wybraniu odpowiedzi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 82, 102, 112),
              Color.fromARGB(255, 231, 176, 92),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<List<Question>>(
          future: futureQuestions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              questions = snapshot.data!;
              if (currentQuestionIndex < 6) {
                final currentQuestion = questions[currentQuestionIndex];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        currentQuestion.question,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ...currentQuestion.incorrectAnswers.map((answer) {
                        return ElevatedButton(
                          onPressed: () {
                            selectAnswer(answer);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedAnswers[
                                        currentQuestionIndex] ==
                                    answer
                                ? Colors
                                    .green // Zaznaczenie wybranej odpowiedzi na zielono
                                : null,
                          ),
                          child: Text(answer),
                        );
                      }),
                    ],
                  ),
                );
              } else {
                // Jeśli użytkownik odpowiedział na 6 pytań, przenieś go do ekranu wyników
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        questions: questions,
                        selectedAnswers: selectedAnswers,
                        correctAnswersCount: correctAnswersCount,
                        restartQuiz: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                      ),
                    ),
                  );
                });
                return const SizedBox
                    .shrink(); // Pusty kontener, który nie jest widoczny
              }
            }
          },
        ),
      ),
    );
  }
}
