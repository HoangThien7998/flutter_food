import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/controllers/cart_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/popular_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/recommend_product_controller.dart';
import 'package:test_fluter/FoodDelivery/src/cart/no_data_empty.dart';
import 'package:test_fluter/FoodDelivery/utils/app_constants.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/widget/app_icon.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';
import 'package:get/get.dart';

import '../../routes/routes_helper.dart';
import '../../utils/dimensions.dart';
import '../main_food_page.dart';

class CartPage extends StatelessWidget{
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: Dimension.Height45,
              left: Dimension.Width20,
              right: Dimension.Width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,backgroundColor: AppColors.mainColor,IconColor: Colors.white,),
                  SizedBox(width: Dimension.Width20*5,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouterHelper.getInitial());
                    },
                    child:  AppIcon(icon: Icons.home,backgroundColor: AppColors.mainColor,IconColor: Colors.white,),
                  ),
                  AppIcon(icon: Icons.shopping_cart,backgroundColor: AppColors.mainColor,IconColor: Colors.white,),
                ],),
            ),

            GetBuilder<CartProductController>(builder: (_cartController){
              return _cartController.getItemsCart.length>0?Positioned(
                  top: Dimension.Height20*4.5,
                  left: Dimension.Width20,
                  right: Dimension.Width20,
                  bottom: 0,
                  child: Container(
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartProductController>(builder: (contrller){
                          var cartList = contrller.getItemsCart;
                          return   ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (_,index){
                                return Container(
                                  width: double.maxFinite,
                                  height: Dimension.Height20*4.5,
                                  margin: EdgeInsets.only(bottom: Dimension.Height10),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          var foodList = Get.find<PopularProductController>().popularProductList.indexWhere(((note) => note.id==cartList[index].product!.id!.toInt()));
                                          if(foodList>=0){
                                            Get.toNamed(RouterHelper.getPopularFood(foodList ,"cartpage"));
                                          }
                                          else{
                                            var recommenedIndex = Get.find<RecommendProductController>().recommendProductList.indexWhere(((note) => note.id==cartList[index].product!.id!.toInt()));
                                            Get.toNamed(RouterHelper.getRecommenedFood(recommenedIndex,"cartpage"));
                                          }
                                        },
                                        child: Container(
                                          width: Dimension.Height20*4.5,
                                          height: Dimension.Height20*4.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimension.radius20),
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+contrller.getItemsCart[index].img!),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: Dimension.Width10,),
                                      Expanded(child:
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            BigText(text: cartList[index].name!),
                                            SmallText(text: "việt nam",),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children:[
                                                  BigText(text: "\$ ${cartList[index].price!}",color: Colors.red,),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(Dimension.radius20),
                                                        color: Colors.white
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap:(){
                                                            contrller.addItem(cartList[index].product!, -1);
                                                          },
                                                          child: Icon(Icons.remove,color: AppColors.signColor,),
                                                        ),

                                                        SizedBox(width: Dimension.Width10/2,),
                                                        BigText(text: "${cartList[index].quantity!}"),
                                                        SizedBox(width: Dimension.Width10/2,),

                                                        GestureDetector(
                                                          onTap:(){
                                                            contrller.addItem(cartList[index].product!, 1);
                                                          },
                                                          child: Icon(Icons.add,color: AppColors.signColor,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ])
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                );
                              });
                        },)
                    ),
                  )):NoDataPage(text: "Giỏ Hàng đang rỗng!");
            })
          ],
        ),
        bottomNavigationBar: GetBuilder<CartProductController>(builder: (controllerCart){
          return controllerCart.getItemsCart.length>0? Container(
            padding: EdgeInsets.only(left: Dimension.Width20,right: Dimension.Width20),
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20),
                    topRight: Radius.circular(Dimension.radius20)
                ),
                color: Colors.black12
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: Dimension.Height20,top:Dimension.Height20,left: Dimension.Height20,right:Dimension.Height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      color: Colors.white
                  ),
                  child: Row(
                    children: [
                      BigText(text: '\$ ${controllerCart.totalAmount.toString()}',),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controllerCart.addToHistory();
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: Dimension.Height20,top:Dimension.Height20,left: Dimension.Height15,right:Dimension.Height15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(text: 'Check Out',),
                  ),
                ),
              ],
            ),
          ):Container( padding: EdgeInsets.only(left: Dimension.Width20,right: Dimension.Width20),
            height: 100,);
        })
      );
  }

}