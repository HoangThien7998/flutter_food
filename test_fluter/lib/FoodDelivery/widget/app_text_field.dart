import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget{
  final TextEditingController textController;
  final String hintText ;
  final IconData icon;
  final TextInputType type;
  final bool HintPass;



  AppTextField({Key? key, required this.textController,required this.icon, required this.hintText, required this.type,this.HintPass = false}): super(key: key);

  @override
  Widget build(BuildContext context) {
      return  Container(
        margin: EdgeInsets.only(top: Dimension.Height10,right: Dimension.Width20,left: Dimension.Width20, ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimension.radius20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 7,
                  offset: Offset(1,10),
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child: TextField(
          keyboardType: type,
          controller: textController,
          obscureText: HintPass,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon,color: AppColors.yellowColor,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white
                )
            ),
          ),

        ),
      );
  }

}