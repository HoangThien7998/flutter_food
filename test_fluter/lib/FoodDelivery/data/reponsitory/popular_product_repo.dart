import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/data/api/api_client.dart';
import 'package:test_fluter/FoodDelivery/utils/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}