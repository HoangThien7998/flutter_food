import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';

import 'app_icon.dart';
import 'big_text.dart';

class AccountWidget extends StatelessWidget{
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key?key,required this.bigText,required this.appIcon}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: Dimension.Width20,top: Dimension.Height20,bottom: Dimension.Height20,right: Dimension.Width20),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimension.Width20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
         BoxShadow(
            blurRadius: 1,
           offset: Offset(0,2),
           color: Colors.grey.withOpacity(0.5)
          )
        ]
      ),
    );
  }
  
}