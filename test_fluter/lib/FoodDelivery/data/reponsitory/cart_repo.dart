import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory=[];
  void addToCartList(List<CartModel> cartlist){
    var time = DateTime.now().toString();
    cart=[];
    /*
      convert objects to string because sharedPreferences only accepcts string
    */
    cartlist.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList("Cart-list", cart);
    getCartList();
  }

  List<CartModel> getCartList(){
    // sharedPreferences.remove("Cart-list");
    // sharedPreferences.remove("cart-history-list");

    List<String>? carts = [];
    if(sharedPreferences.containsKey("Cart-list")){
      carts = sharedPreferences.getStringList("Cart-list");
    }
    List<CartModel> cartList = [];

    carts?.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });


    return cartList;
  }

  List<CartModel> getCartHistoryList(){

    if(sharedPreferences.containsKey("cart-history-list")){
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList("cart-history-list")!;
    }

    List<CartModel> cartHistoryList = [];

    cartHistory?.forEach((element) {
      cartHistoryList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartHistoryList;
  }

  void addToCartHistoryList(){
    if(sharedPreferences.containsKey("cart-history-list")){
      cartHistory = sharedPreferences.getStringList("cart-history-list")!;
    }
    for(int i=0;i<cart.length;i++){
      cartHistory.add(cart[i]);
    }
    print("lịch sử giỏ hàng:" + cartHistory.length.toString());
    removeCart();
    sharedPreferences.setStringList("cart-history-list", cartHistory);
  }

  void removeCart(){
    sharedPreferences.remove("Cart-list");
  }
}