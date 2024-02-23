import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/app_icon.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';

import '../../widget/account_widget.dart';

class AccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            height: Dimension.Height20*4,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimension.Height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Profile",size: 30,),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: Dimension.Height20),
              width: double.maxFinite,

                  child: Column(
                    children: [
                      AppIcon(icon: Icons.person,size: Dimension.Height20*6+Dimension.Height30,backgroundColor: AppColors.mainColor,IconSize: Dimension.Height20*5,IconColor: Colors.white,),
                      SizedBox(height: Dimension.Height20,),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [AccountWidget(
                              appIcon: AppIcon(icon: Icons.person,size: 40,backgroundColor: AppColors.mainColor,IconColor: Colors.white,IconSize: 20,),
                              bigText: BigText(text: "Van Teo",size: 30,),
                            ),
                              SizedBox(height: Dimension.Height20,),
                              AccountWidget(
                                appIcon: AppIcon(icon: Icons.phone,size: 40,backgroundColor: AppColors.yellowColor,IconColor: Colors.white,IconSize: 20,),
                                bigText: BigText(text: "0903876240",size: 30,),
                              ),
                              SizedBox(height: Dimension.Height20,),
                              AccountWidget(
                                appIcon: AppIcon(icon: Icons.mail,size: 40,backgroundColor: AppColors.yellowColor,IconColor: Colors.white,IconSize: 20,),
                                bigText: BigText(text: "teo@gmail.com",size: 30,),
                              ),
                              SizedBox(height: Dimension.Height20,),
                              AccountWidget(
                                appIcon: AppIcon(icon: Icons.local_attraction_rounded,size: 40,backgroundColor: AppColors.yellowColor,IconColor: Colors.white,IconSize: 20,),
                                bigText: BigText(text: "teo@gmail.com",size: 30,),
                              ),
                              SizedBox(height: Dimension.Height20,),
                              AccountWidget(
                                appIcon: AppIcon(icon: Icons.location_on,size: 40,backgroundColor: AppColors.yellowColor,IconColor: Colors.white,IconSize: 20,),
                                bigText: BigText(text: "teo@gmail.com",size: 30,),
                              ),
                              SizedBox(height: Dimension.Height20,),
                              AccountWidget(
                                appIcon: AppIcon(icon: Icons.notes,size: 40,backgroundColor: Colors.redAccent,IconColor: Colors.white,IconSize: 20,),
                                bigText: BigText(text: "teo@gmail.com",size: 30,),
                              ),],
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }

}