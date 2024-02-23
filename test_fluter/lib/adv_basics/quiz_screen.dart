import 'package:flutter/material.dart';
import 'package:test_fluter/adv_basics/question_screen.dart';
import 'package:test_fluter/adv_basics/start_screen.dart';
import 'data/questions.dart';
import 'results_screen.dart';

class QuizScreen extends StatefulWidget{
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return  _QuizScreen();
  }

}

class _QuizScreen extends State<QuizScreen>{
  List<String> selectAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen(){
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswers(String answer){
      selectAnswers.add(answer);

      if(selectAnswers.length == questions.length){
        setState(() {
          activeScreen = "result-screen";
        });
      }
  }

  @override
  Widget build( context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == "questions-screen"){
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswers,);
    }else if(activeScreen == 'result-screen'){
      screenWidget = resultScreen(chosenAnswers: selectAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient:LinearGradient(
                  colors: [Colors.purple,Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
          child: screenWidget,
        ),

      ),
    );
  }

}