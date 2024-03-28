import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (e) => Row(
                  children: [
                    Text(
                      ((e['question_id'] as int) + 1).toString(),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(e['question'] as String),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            e['user_answer'] as String,
                            style: TextStyle(
                              color: e['user_answer'] == e['correct_answer']
                                  ? const Color.fromARGB(255, 64, 207, 64)
                                  : Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            e['correct_answer'] as String,
                            style: GoogleFonts.robotoCondensed(
                                color: const Color.fromARGB(255, 64, 207, 64),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
