import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizz_flutter/Completed_screen.dart';
import 'package:quizz_flutter/options.dart';
import 'package:http/http.dart' as http;

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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 420,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 30,
                    child: Container(
                      height: 170,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: Color.fromARGB(136, 0, 0, 0)),
                        ],
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
                              height: 25,
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
                    bottom: 210,
                    left: 165,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: const Color.fromARGB(213, 104, 174, 207),
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
                children: (responseData.isNotEmpty &&
                        responseData[number]['incorrect_answers'] != null)
                    ? shuffledOptions.map((option) {
                        return Options(option: option.toString());
                      }).toList()
                    : []),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10),
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
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
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
    });
  }

  void completed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Completed()));
  }

  void updateShuffleOption() {
    setState(
      () {
        shuffledOptions = shuffleOption(
          [
            responseData[number]['correct_answer'],
            ...(responseData[number]['incorrect_answers'] as List),
          ],
        );
      },
    );
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
