import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/quiz-logo.png', width: 300),
                SizedBox(height: 80),
                Text(
                  'Learn Mathematics !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: startQuiz,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 67, 30, 129)),
                  icon: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Start Quizz',
                  ),
                ),
              ],
            ),
          );
  }
}