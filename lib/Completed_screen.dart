import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_flutter/quiz_screen.dart';

class Completed extends StatelessWidget {
  const Completed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 521,
          width: 400,
          child: Stack(
            children: [
              Container(
                height: 340,
                width: 410,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: const Color.fromARGB(92, 255, 255, 255),
                    child: CircleAvatar(
                      radius: 71,
                      backgroundColor: const Color.fromARGB(123, 255, 255, 255),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Twój wynik to',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrangeAccent),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '10',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                  children: const [
                                    TextSpan(
                                      text: 'pkt',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 22,
                child: Container(
                  height: 190,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(209, 250, 214, 53),
                          offset: Offset(0, 1)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Row(children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    Text(
                                      '95%',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ]),
                                ),
                                const Text('Ukończono')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Row(children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    const Text(
                                      '10',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ]),
                                ),
                                const Text('Wszystkie Pytania')
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Row(children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const Text(
                                      '8',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ]),
                                ),
                                const Text('Poprawne Odpowiedzi')
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Row(children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                      const Text(
                                        '2',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const Text('Błędne odpowiedzi')
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
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
                const Column(
                  children: [
                    CircleAvatar(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Zobacz odpowiedzi',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 35,
                      child: Center(
                        child: Icon(
                          Icons.home,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Strona Główna',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
