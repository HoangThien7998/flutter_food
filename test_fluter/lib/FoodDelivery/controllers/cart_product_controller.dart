import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/data/reponsitory/cart_repo.dart';
import 'package:test_fluter/FoodDelivery/models/products_model.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartProductController extends GetxController{
  final CartRepo cartRepo;

  CartProductController({required this.cartRepo});
  Map<int, CartModel> _itemsCart={};

  Map<int, CartModel> get itemsCart=>_itemsCart;
  List<CartModel> storageItems=[];

  void addItem(ProductModel product,int quantity){
    var totalQuantity = 0;
    if(_itemsCart.containsKey(product.id!)){
      _itemsCart.update(product.id!, (value){
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img : value.img,
            quantity : value.quantity! + quantity,
            isExist : true,
            time : DateTime.now().toString(),
          product: product,
        );
      });
      if(totalQuantity <= 0){
        _itemsCart.remove(product.id);
      }
    }else{

      if(quantity > 0){
        _itemsCart.putIfAbsent(product.id!, () {
          return CartModel(  id: product.id,
              name: product.name,
              price: product.price,
              img : product.img,
              quantity : quantity,
              isExist : true,
              time : DateTime.now().toString(),
            product: product,
          );
        }
        );
      }else{
        Get.snackbar("Số lượng sản phẩm", "Nên ít nhất có 1 sản phẩm trong đơn hàng!",
            backgroundColor: AppColors.mainColor,
            colorText: Colors.black
        );
      }
    }
    // print(getItemsCart);
    cartRepo.addToCartList(getItemsCart);
    update();
  }

  bool existInCart(ProductModel product){
    if(_itemsCart.containsKey(product.id!)){
      return true;
    }
    return false;
  }

  getQuantity(ProductModel product){
    int quantity = 0;
    if(_itemsCart.containsKey(product.id)){
      _itemsCart.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _itemsCart.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItemsCart{
    // print(_itemsCart.toString());
    return _itemsCart.entries.map((e){
      return e.value;
    }).toList();
  }

  int get totalAmount{
    var total = 0;
    _itemsCart.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData(){
    SetCart = cartRepo.getCartList();
    return storageItems;
  }

  set SetCart(List<CartModel> items){
    storageItems = items;
    for(int i=0;i<storageItems.length;i++ ){
      _itemsCart.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory(){
    cartRepo.addToCartHistoryList();
    _clear();
  }

  void _clear() {
    _itemsCart={};
    update();
  }

  List<CartModel> getCartHistory(){
    return cartRepo.getCartHistoryList();
  }

  set SetItemsCart(Map<int, CartModel> setItems){
      _itemsCart = {};
      _itemsCart = setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItemsCart);
    update();
  }
}