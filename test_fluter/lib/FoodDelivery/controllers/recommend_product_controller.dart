import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/models/products_model.dart';
import '../data/reponsitory/recommend_product_repo.dart';


class RecommendProductController extends GetxController{
  final RecommendProductRepo recommendProductRepo;

  RecommendProductController({required this.recommendProductRepo});
  List<dynamic> _recommendProductList = [];
  List<dynamic> get recommendProductList => _recommendProductList;

  bool _isLoad = false;
  bool get isLoad=>_isLoad;

  Future<void> getRecommendProductList() async{
    Response response = await recommendProductRepo.getRecommendProductList();
    if(response.statusCode == 200){
      _recommendProductList = [];
      _recommendProductList.addAll(productt.fromJson(response.body).products);
      _isLoad=true;
      update();
    }

  }
}