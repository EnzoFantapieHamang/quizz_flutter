import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/questions_summary/questions_summary.dart';
import 'package:quizz/questions_summary/summary_item.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.choosenAnswers, required this.onRestart, super.key});

  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': choosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              label: Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.refresh_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
