import 'package:flutter/material.dart';

class answerButton extends StatelessWidget{
  answerButton({super.key,required this.onTap,required this.Textbutton});

  final String Textbutton;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          onPressed:onTap,
          child: Text(Textbutton,textAlign: TextAlign.center,)
      ),
    );
  }
}