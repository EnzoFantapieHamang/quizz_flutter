import 'package:flutter/material.dart';
import 'package:quizz/AnswerButton.dart';
import 'package:quizz/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);

    setState(() {
      currentQuestionIndex++;
    });
  }


  @override
  Widget build(BuildContext context) {

    var currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
            SizedBox(height: 30,),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Answerbutton(
                  onSelect: () {
                    answerQuestion(answer);
                  },
                  answerText: answer,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}