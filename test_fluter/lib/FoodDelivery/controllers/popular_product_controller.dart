import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/controllers/cart_product_controller.dart';
import 'package:test_fluter/FoodDelivery/models/products_model.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import '../data/reponsitory/popular_product_repo.dart';
import '../models/cart_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartProductController _cart;

  bool _isLoad = false;
  bool get isLoad=>_isLoad;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    //print(response.);
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(productt.fromJson(response.body).products);
      //print(_popularProductList.toString());
      _isLoad=true;
      update();
    }
  }

  int _quantity = 0;
  int get quantity=>_quantity;

  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;



  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity =checkQuantity(_quantity + 1);

    }else{
      _quantity =checkQuantity(_quantity - 1);
    }
    print(_quantity.toString());
    update();
  }
  
  int checkQuantity(int quantity){
    if( _inCartItems + quantity < 0){
      Get.snackbar("Số lượng sản phẩm", "Bạn không thể giảm nữa!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white
      );
      if(_inCartItems > 0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product ,CartProductController cartProductController){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cartProductController;
    var exist = false;
    exist = _cart.existInCart(product);
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    print("Số lượng:"+_inCartItems.toString());
    print("Số lượng:"+_quantity.toString());
  }

  void addItem(ProductModel product){
    // print(product.toJson());
        _cart.addItem(product, _quantity);
        _quantity = 0;
        _inCartItems = _cart.getQuantity(product);

        update();
  }

  int get TotalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItemsCart;
  }
}