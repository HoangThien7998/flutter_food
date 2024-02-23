import 'dart:ffi';

import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/src/main_food_page.dart';
import 'package:test_fluter/FoodDelivery/src/page/food_page_detail.dart';
import 'package:test_fluter/FoodDelivery/src/splash/splash_page.dart';


import '../src/account/sign_up_page.dart';
import '../src/cart/cart_page.dart';
import '../src/home_page.dart';
import '../src/page/recommended_food_detail.dart';

class RouterHelper {
  static const String signUp="/signup-page";
  static const String splash="/splash-page";
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static const String cartFood="/cart-food";

  static String getSignUp()=>'$signUp';
  static String getSplash()=>'$splash';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId,String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getRecommenedFood(int pageId,String page)=>'$recommendedFood?pageId=$pageId&page=$page';
  static String getCartFood()=>'$cartFood';

  static List<GetPage> routes=[

    GetPage(name: signUp, page: ()=>SignUpPage()),
    GetPage(name: splash, page: ()=>SplashPage()),
    GetPage(name: initial, page: (){
      return HomePage();
      },
        transition: Transition.fadeIn,
    ),
    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return FoodPageDetail(pageId:int.parse(pageId!), page:page!);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return Recommended(pageId:int.parse(pageId!),page:page!);
    },
      transition: Transition.fadeIn,
    ),

    GetPage(name: cartFood, page: (){
      return CartPage();
    },
      transition: Transition.fadeIn,
    ),
  ];
}