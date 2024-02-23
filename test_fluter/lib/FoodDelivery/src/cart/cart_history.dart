import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/models/cart_model.dart';
import 'package:test_fluter/FoodDelivery/src/cart/no_data_empty.dart';
import 'package:test_fluter/FoodDelivery/utils/app_constants.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/app_icon.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';
import '../../controllers/cart_product_controller.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../routes/routes_helper.dart';

class CartHistory extends StatelessWidget{
  const CartHistory({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistory = Get.find<CartProductController>().getCartHistory().reversed.toList(

    );
    Map<String, int> cartItemPerOrder = Map();
    
    for(int i=0;i<getCartHistory.length;i++){
      if(cartItemPerOrder.containsKey(getCartHistory[i].time!.toString())){
        cartItemPerOrder.update(getCartHistory[i].time!.toString(), (value){
          print(value);
          return ++value;
        });
      }else{
        cartItemPerOrder.putIfAbsent(getCartHistory[i].time!.toString(), () => 1);
      }
    }

    List<int> CartItemsOrderTimeToList(){
      return cartItemPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> CartOrderTimeToList(){
      return cartItemPerOrder.entries.map((e) => e.key).toList();
    }
    List<int> orderTimes = CartItemsOrderTimeToList();
    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimension.Height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History",),
                AppIcon(icon: Icons.shopping_cart,IconColor: Colors.white,)
              ],
            ),
          ),
          getCartHistory.length>0?Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimension.Height20,
                  right: Dimension.Height20,
                ),
                child: ListView(
                  children: [
                    for(int i = 0;i<cartItemPerOrder.length;i++)
                      Container(
                        height:Dimension.Height20*8,
                        margin: EdgeInsets.only(bottom: Dimension.Height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ((){

                                var inputDate = DateTime.parse(getCartHistory[listCounter].time!.toString());
                                var outputFormat = DateFormat("dd/MM/yyyy hh:mm a");
                                var outputDate = outputFormat.format(inputDate);
                                return BigText(text: outputDate);
                              }()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(orderTimes[i], (index){
                                        if(listCounter<getCartHistory.length){
                                          listCounter++;
                                        }
                                        return index<=2?Container(
                                          height: Dimension.Height20*4,
                                          width: Dimension.Height20*4,
                                          margin: EdgeInsets.only(right: Dimension.Width10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimension.Height20/2),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL+"/uploads/"+getCartHistory[listCounter-1].img!

                                              ),
                                            )
                                          ),

                                        ):Container();
                                      })
                                  ),

                                    Container(
                                      height: Dimension.Height20*6,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SmallText(text: "Total",color: Colors.black,),
                                          BigText(text: orderTimes[i].toString()+"Items"),
                                          GestureDetector(
                                            onTap:(){
                                              var orderTime = CartOrderTimeToList();
                                              Map<int, CartModel> moreOrder = {};
                                              for(int j=0; j<getCartHistory.length;j++){
                                                if(getCartHistory[j].time == orderTime[i]){
                                                  moreOrder.putIfAbsent(getCartHistory[j].id!, () => CartModel.fromJson(jsonDecode(jsonEncode(getCartHistory[j]))));
                                                }
                                              }
                                              Get.find<CartProductController>().SetItemsCart = moreOrder;
                                              Get.find<CartProductController>().addToCartList();
                                              Get.toNamed(RouterHelper.getCartFood());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical:Dimension.Width10/2,horizontal: Dimension.Height10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimension.Height10/2),
                                                border: Border.all(width: 1,color: AppColors.mainColor)
                                              ),
                                              child: SmallText(text: "one more",color: AppColors.mainColor,),
                                            ),
                                          )
                                        ],
                                      )
                                    )
                                ],
                              ),
                            ],
                          )
                      )
                  ],
                ),
              )
          ):Container(
            height: MediaQuery.of(context).size.height/1.5,
              child: NoDataPage(text: "Lịch sử Giỏ hàng rỗng!",imgPath: "assets/img_food/box_empty.png",))
        ],
      ),
    );
  }
  
}