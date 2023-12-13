import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/src/food_page_body.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';

class MainFoodPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainFoodPage();

}

class _MainFoodPage extends State<MainFoodPage> {

  @override
  Widget build(BuildContext context){
    print(MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimension.Height45,bottom: Dimension.Height30),
            padding: EdgeInsets.only(left: Dimension.Width20,right: Dimension.Width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                BigText(text:"Thành Phố Hồ Chí Minh",color: AppColors.mainColor,),
                Row(
                  children: [
                    SmallText(text:"Đỗ Hoàng Thiện"),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ],),
              Container(
                  width: Dimension.Width45,
                  height: Dimension.Height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: Icon(Icons.search, color: Colors.white,),
                ),
            ],
          ),
        ),
          Expanded(child: SingleChildScrollView(child: FoodpageBody(),))

        ],
      ),);
  }
}