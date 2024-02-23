import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/quiz-logo.png',height: 350,),
          ),
          SizedBox(height: 30,),
          Text("Learn Flutter the fun way",style: TextStyle(fontSize: 30,color: Colors.white),),
          SizedBox(height: 30,),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: Icon(Icons.import_contacts_sharp),
              label:const Text("Start Quiz",),
          )
        ],
      ),
    );
  }
}