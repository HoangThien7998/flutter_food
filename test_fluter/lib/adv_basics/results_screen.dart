import 'package:flutter/material.dart';
import 'package:test_fluter/adv_basics/question_summary.dart';

import 'data/questions.dart';


class resultScreen extends StatelessWidget{
  const resultScreen ({super.key,required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summary = [];
    for(var i = 0;i < chosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You answered X out of Y question correctly'),
          SizedBox(height: 30,),
          Container(
            width: double.infinity,
            child: questionSummary(summary: getSummaryData()),
          ),

          SizedBox(height: 30,),
          TextButton(
              onPressed: (){},
              child: Text('Restart Quiz')
          )
        ],
      ),
    );
  }

}