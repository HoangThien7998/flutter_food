import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  @override
  State<DiceRoller> createState() {
      return _DiceRoller();
  }
}

class _DiceRoller extends State<DiceRoller>{
  var activeDiceImage = "assets/dice_1.png";

  void rollDice(){
    int a = Random().nextInt(6)+1;
    setState((){
      activeDiceImage = 'assets/dice_${a.toString()}.png';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(activeDiceImage, width: 200,),
        ),
        TextButton(onPressed: rollDice, child: const Text("Roll Dice"))
      ],
    );
  }
}