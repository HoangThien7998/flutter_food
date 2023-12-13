import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/icon_text.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';

import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget{
  final String text;
  final double size;

  AppColumn({Key? key, required this.text,required this.size}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: size,),
        SizedBox(height: Dimension.Height10,),
        Row(children: [
          Wrap(
            children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 16,)),
          ),
          SizedBox(width: Dimension.Width10,),
          SmallText(text: '4.5',color: AppColors.textColor,size: 16,),
          SizedBox(width: Dimension.Width10,),
          SmallText(text: '1287',color: AppColors.textColor,size: 16,),
          SizedBox(width: Dimension.Width10,),
          SmallText(text: 'comments',color: AppColors.textColor,size: 16,),
        ],
        ),
        SizedBox(height: Dimension.Height10,),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWigdet(icon: Icons.circle_sharp, text: "Normal", coloricon: AppColors.iconColor1,size: 16,),
            IconAndTextWigdet(icon: Icons.location_on, text: "1.7", coloricon: AppColors.mainColor),
            IconAndTextWigdet(icon: Icons.timer_rounded, text: "32 min", coloricon: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }

}