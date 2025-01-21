import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  QuestionIdentifier({required this.isCorrectAnswer, required this.number,   super.key});


  final bool isCorrectAnswer;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isCorrectAnswer ? const Color.fromARGB(255, 115, 233, 119) : const Color.fromARGB(255, 253, 144, 136),
      ),
      width: 30,
      height: 30,
      child: Text(number.toString()),
    );
  }
}