import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }

}

class _QuestionScreen extends State<QuestionScreen>{
  var currentQuestionIndex = 0;

  void incrementQuestione(String selectAnswer){
    widget.onSelectAnswer(selectAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }


  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 30,right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

              child: Text(currentQuestion.text,textAlign: TextAlign.center,
                style:  GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ))
          ),
          SizedBox(height: 30,),
          ... currentQuestion.getShuffledAnswers().map((answer){
            return answerButton(Textbutton:answer,onTap: (){incrementQuestione(answer);});
          })

        ],
      ),
    );
  }

}