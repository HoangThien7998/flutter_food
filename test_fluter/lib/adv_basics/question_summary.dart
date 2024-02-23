import 'package:flutter/material.dart';

class questionSummary extends StatelessWidget{
  questionSummary({super.key,required this.summary});

  List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
   return Column(

     children: summary.map((data){
       return Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(((data['question_index'] as int) +1).toString()),
           Expanded(
             child: Column(
               children: [
                 Text(textAlign:TextAlign.center, data['question'] as String),
                 SizedBox(height: 5,),
                 Text(data['correct_answer'] as String),
                 SizedBox(height: 5,),
                 Text(data['user_answer'] as String),
               ],
             ),
           ),
         ],
       );
     }).toList(),
   );
  }

}