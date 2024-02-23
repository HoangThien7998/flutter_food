import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/routes/routes_helper.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPage createState() => _SplashPage();

}

class _SplashPage extends State<SplashPage> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      const Duration(seconds: 3),
        ()=>Get.toNamed(RouterHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
                child: Image.asset("assets/img_food/foodlogo.png",width: Dimension.SplashSize,),
              ),
          ),
          ScaleTransition(
            scale: animation,
            child: Center(
              child: BigText(text: "THE BEST FOOD",size: Dimension.Height45,),
            ),
          )
        ],
      ),
    );
  }

}