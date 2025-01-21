import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  Answerbutton({required this.onSelect, required this.answerText, super.key});


  final void Function() onSelect;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 48, 16, 102),
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 40,
        ),
        textStyle: TextStyle(
          fontSize: 16,
        )
      ),
      onPressed: onSelect,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}