import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget{
  final Color? color;
  final String text;
  double size ;
  TextOverflow overflow;

  BigText({Key? key, this.color = const Color(0xFF332d2b), required this.text,this.size = 0,this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: size==0?Dimension.font20:size,),
    );
  }
  
}