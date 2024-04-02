import 'package:flutter/material.dart';
import 'package:quizz_flutter/Completed_screen.dart';

class Options extends StatelessWidget {
  Options({super.key, required this.option});
  String option;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 3, color: Colors.orange),
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
                        groupValue: 2,
                        onChanged: (val) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Completed()));
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
