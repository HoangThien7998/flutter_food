import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:test_fluter/FoodDelivery/controllers/cart_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/popular_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/recommend_product_controller.dart';
import 'package:test_fluter/FoodDelivery/data/reponsitory/popular_product_repo.dart';
import 'package:test_fluter/FoodDelivery/routes/routes_helper.dart';
import 'package:test_fluter/FoodDelivery/src/splash/splash_page.dart';
import 'FoodDelivery/src/account/sign_in_page.dart';
import 'FoodDelivery/src/account/sign_up_page.dart';
import 'FoodDelivery/src/cart/cart_page.dart';
import 'FoodDelivery/src/main_food_page.dart';
import 'package:get/get.dart';
import 'FoodDelivery/src/page/food_page_detail.dart';
import 'FoodDelivery/src/page/recommended_food_detail.dart';
import 'adv_basics/quiz_screen.dart';
import 'adv_basics/start_screen.dart';
import 'appTaxi/src/app.dart';
import 'appTaxi/src/login_taxi.dart';
import 'appTaxi/bloc/taxi_bloc.dart';
import 'FoodDelivery/helper/dependencies.dart' as dep;

import 'begin_flutter/gradient_container.dart';


void main(){

  // WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyBVudHO3DxS7TVrn1SYzNzsFXoqZXQ4VMo",
  //     appId: "1:379935375014:android:e0d6344162480c5ed0be67",
  //     messagingSenderId: "379935375014",
  //     projectId: "taxiapp-1f1f0",
  //   ),
  // );

  // runApp(Myapp_taxi(new TaxiBloc(),MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Screenlogin(),
  //
  // )));

  runApp(QuizScreen());
}

// class Myapptest extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     Get.find<CartProductController>().getCartData();
//     Get.find<PopularProductController>().getPopularProductList();
//     Get.find<RecommendProductController>().getRecommendProductList();
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//        home: SignInPage(),
//       // initialRoute: RouterHelper.getSignUp(),
//       getPages: RouterHelper.routes,
//     );
//
//   }
// }



