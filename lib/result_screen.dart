import 'package:flutter/material.dart';
import 'package:quizz_flutter/answers_screen.dart';
import 'package:quizz_flutter/quiz_screen.dart';
import 'package:quizz_flutter/start_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> userAnswers;

  const ResultScreen({super.key, required this.userAnswers});

  int calculateCorrectAnswers() {
    int correctAnswers = 0;
    for (var answer in userAnswers) {
      if (answer['isCorrect'] == true) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers = calculateCorrectAnswers();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC0D6B0), // Pastelowa zieleń
              Color(0xFF84A98C), // Dodatkowy kolor dla efektu
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 521,
              width: 400,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 190,
                      width: 350,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(
                                0.2), // Bardziej przezroczysty kolor szkła
                            Colors.white
                                .withOpacity(0.1) // Kolor cienia na efekt szkła
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ],
                        border: Border.all(
                          color: const Color.fromARGB(255, 179, 31, 238),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Twój wynik to:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$correctAnswers pkt / 10', // wyświetlanie liczby poprawnych odpowiedzi
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnswerScreen(
                                    questionsAndAnswers: userAnswers),
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 35,
                            child: Center(
                              child: Icon(
                                Icons.visibility_rounded,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Zobacz odpowiedzi',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QuizScreen()));
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 35,
                            child: Center(
                              child: Icon(
                                Icons.refresh,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Zagraj jeszcze raz',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()));
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 35,
                            child: Center(
                              child: Icon(
                                Icons.home,
                                size: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Strona Główna',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
