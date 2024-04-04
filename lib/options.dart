import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String option;
  final Function(String) onOptionSelected;

  const Options(
      {super.key, required this.option, required this.onOptionSelected});

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
                        groupValue: null,
                        onChanged: (val) {
                          onOptionSelected(val.toString());
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
