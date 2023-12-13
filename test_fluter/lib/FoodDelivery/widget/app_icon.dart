import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget{
  final IconData icon;
  final Color backgroundColor ;
  final Color IconColor;
  final double size;

  AppIcon({Key? key, required this.icon, this.backgroundColor = const Color(0xFFfc4e4),
  this.size = 40,this.IconColor =  Colors.black45}): super(key: key);

  Widget build(BuildContext context){
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(icon,color: IconColor,size: 20,),
    );
  }

}
