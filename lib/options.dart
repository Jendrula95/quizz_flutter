import 'package:flutter/material.dart';
import 'package:quizz_flutter/result_screen.dart';

class Options extends StatelessWidget {
  final String option;
  final Function(String) onOptionSelected;

  Options({Key? key, required this.option, required this.onOptionSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                width: 3, color: const Color.fromARGB(66, 179, 31, 238)),
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      option,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: option,
                        groupValue:
                            null, // Wartość grupy powinna być ustawiona na null
                        onChanged: (val) {
                          onOptionSelected(val
                              .toString()); // Wywołanie funkcji przekazanej z QuizScreen
                        })
                  ],
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
