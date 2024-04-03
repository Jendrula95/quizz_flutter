import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_flutter/options.dart';
import 'package:quizz_flutter/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List responseData = [];
  List<String> shuffledOptions = [];
  int number = 0;
  int currentQuestionNumber = 1;
  int? selectedAnswerIndex;
  late Timer _timer;
  int _secondRemaining = 20;

  Future api() async {
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        updateShuffleOption();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    api();
    startTimer();
  }

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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 420,
                width: 400,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 60,
                      left: 30,
                      child: Container(
                        height: 170,
                        width: 350,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(
                                  0.2), // Bardziej przezroczysty kolor szkła
                              Colors.white.withOpacity(
                                  0.1) // Kolor cienia na efekt szkła
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Pytanie $currentQuestionNumber/10',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Text(
                                responseData.isNotEmpty
                                    ? responseData[number]['question']
                                    : '',
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 270,
                      left: 145,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor:
                            const Color.fromARGB(135, 149, 185, 226),
                        child: Center(
                          child: Text(_secondRemaining.toString(),
                              style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: shuffledOptions.map((option) {
                  return RadioListTile<int>(
                    title: Text(option),
                    value: shuffledOptions.indexOf(option),
                    groupValue: selectedAnswerIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedAnswerIndex = value;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(134, 74, 188, 233),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                  ),
                  onPressed: () {
                    nextQuestion();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextQuestion() {
    if (number == 9) {
      completed();
    }
    setState(() {
      number = number + 1;
      currentQuestionNumber++;
      updateShuffleOption();
      _secondRemaining = 20;
      selectedAnswerIndex =
          null; // Resetuj wybraną odpowiedź po przejściu do kolejnego pytania
    });
  }

  void completed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ResultScreen()),
    );
  }

  void updateShuffleOption() {
    setState(() {
      shuffledOptions = shuffleOption(
        [
          responseData[number]['correct_answer'],
          ...(responseData[number]['incorrect_answers'] as List),
        ],
      );
    });
  }

  List<String> shuffleOption(List<String> option) {
    List<String> shuffledOptions = List.from(option);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondRemaining > 0) {
          _secondRemaining--;
        } else {
          nextQuestion();
          _secondRemaining = 20;
          updateShuffleOption();
        }
      });
    });
  }
}
