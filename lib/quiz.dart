import 'package:flutter/material.dart';
import 'package:quizz/questions-screen.dart';
import 'package:quizz/result-screen.dart';
import 'package:quizz/start-creen.dart';
import 'package:quizz/data/questions.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  var _activeScreen = "Start-Screen";
  List<String> _selectedAnswers = [];

  void restart(){
    setState((){
      _selectedAnswers = [];
      _activeScreen = "Questions-Screen";
    });
  }

  void _switchScreen(){
    setState(() {
      _activeScreen = "Questions-Screen";
    });
  }

  void _chooseAnswers(String answer){
    _selectedAnswers.add(answer);

    if(_selectedAnswers.length == questions.length){
      setState(() {
        _activeScreen = "Results-Screen";
      });
      
    }
  }




  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if(_activeScreen == "Questions-Screen"){
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswers,
      );
    }

    if(_activeScreen == "Results-Screen"){
      screenWidget = ResultScreen(
        choosenAnswers: _selectedAnswers,
        onRestart: restart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                const Color.fromARGB(255, 160, 127, 218),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}