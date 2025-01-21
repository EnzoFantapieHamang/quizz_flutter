import 'package:flutter/material.dart';
import 'package:quizz/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem(this.data, {super.key});

  final Map<String,Object> data;

  @override
  Widget build(BuildContext context) {

    final isCorrectAnswer = data["user_answer"] == data["correct_answer"];

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            number: data['question_index'] as int,
          ),
          SizedBox(width: 30,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                Text(data['user_answer'] as String,
                    style: TextStyle(
                    color: const Color.fromARGB(255, 245, 189, 255),
                  ),),
                Text(data['correct_answer'] as String,
                    style: TextStyle(
                    color: const Color.fromARGB(255, 182, 205, 243),
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}