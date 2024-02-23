import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';

class CustomLoader extends StatelessWidget{
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        height: Dimension.Height20*5,
        width: Dimension.Height20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.Height20*5/2),
          color: AppColors.mainColor
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}