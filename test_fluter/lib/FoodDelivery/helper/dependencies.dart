import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/controllers/auth_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/cart_product_controller.dart';
import 'package:test_fluter/FoodDelivery/data/reponsitory/cart_repo.dart';
import 'package:test_fluter/FoodDelivery/data/reponsitory/popular_product_repo.dart';
import 'package:test_fluter/FoodDelivery/utils/app_constants.dart';

import '../controllers/popular_product_controller.dart';
import '../controllers/recommend_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/reponsitory/auth_repo.dart';
import '../data/reponsitory/recommend_product_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api get
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),sharedPreferences:Get.find()));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepo:Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() => RecommendProductController(recommendProductRepo:Get.find()));
  Get.lazyPut(() => CartProductController(cartRepo:Get.find()));

}