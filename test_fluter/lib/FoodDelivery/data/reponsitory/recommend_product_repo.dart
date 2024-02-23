import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/data/api/api_client.dart';
import 'package:test_fluter/FoodDelivery/utils/app_constants.dart';

class RecommendProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendProductRepo({required this.apiClient});

  Future<Response> getRecommendProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}