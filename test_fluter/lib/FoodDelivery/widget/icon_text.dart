import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';

import '../utils/dimensions.dart';

class IconAndTextWigdet extends StatelessWidget{
  final IconData icon;
  final String text;
  final Color coloricon;
  final double size;

  const IconAndTextWigdet({Key? key,required this.icon , required this.text ,required this.coloricon,this.size = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Icon(icon,color: coloricon,size: 20,),
          SizedBox(width: 2,),
          SmallText(text: text,color: AppColors.textColor,size: size==0?Dimension.font14:size,),
          SizedBox(width: Dimension.Width10),
        ],
      );
  }

}

