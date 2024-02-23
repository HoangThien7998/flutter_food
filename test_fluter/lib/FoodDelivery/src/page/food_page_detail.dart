import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/controllers/cart_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/popular_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/recommend_product_controller.dart';
import 'package:test_fluter/FoodDelivery/routes/routes_helper.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/widget/app_icon.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/expandable_text.dart';

import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import '../../widget/app_column.dart';
import '../cart/cart_page.dart';
import '../main_food_page.dart';

class FoodPageDetail extends StatelessWidget{
  int pageId;
  String page;
  FoodPageDetail({Key? key,required this.pageId, required this.page}):super(key:key);

  @override
  Widget build(BuildContext context){
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartProductController>());
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.FoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+product.img!),
                  ),
                ),
              ),
            ),
            Positioned(
                top: Dimension.Height45,
                left: Dimension.Width20,
                right: Dimension.Width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap:(){
                          if(page == "cartpage"){
                            Get.toNamed(RouterHelper.getCartFood());
                          }else{
                            Get.toNamed(RouterHelper.getInitial());
                          }

                        },
                        child: AppIcon(icon: Icons.arrow_back_ios,),),
                    GetBuilder<PopularProductController>(builder: (controller){
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Get.toNamed(RouterHelper.getCartFood());
                            },
                              child: AppIcon(icon: Icons.shopping_cart,)
                          ),
                          Get.find<PopularProductController>().TotalItems >= 1? Positioned(right: 0,top: 0,child: AppIcon(icon: Icons.circle,size: 18,IconColor: AppColors.mainColor,)) : Container(),
                          Get.find<PopularProductController>().TotalItems >= 1? Positioned(
                                right: 5,top: 3,
                            child: BigText(text: Get.find<PopularProductController>().TotalItems.toString(),size: 12,color: Colors.white,),
                              ):Container(),
                        ],
                      );
                    }),

                  ],
                )
            ),
            Positioned(
                top: Dimension.FoodInfoSize,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(

                  padding: EdgeInsets.only(left: Dimension.Width20,right: Dimension.Width20,top: Dimension.Height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimension.radius20),
                      topLeft: Radius.circular(Dimension.radius20),
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name,size: Dimension.font26,star: product.stars,),
                      SizedBox(height: Dimension.Height30,),
                      BigText(text: "Giới Thiệu Món Ăn",size: Dimension.font26),
                      Expanded(child: SingleChildScrollView(child: ExpandableText(text: product.description.toString(),
                      ),
                      ),
                      ),
                    ],
                  ),)
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
          return Container(
            padding: EdgeInsets.only(left: Dimension.Width20,right: Dimension.Width20),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20),
                topRight: Radius.circular(Dimension.radius20),
              ),
              color: const Color(0xFFfc4e4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: Dimension.Height20,top:Dimension.Height20,left: Dimension.Height15,right:Dimension.Height15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap:(){
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(Icons.remove,color: AppColors.signColor,),
                      ),
                      SizedBox(width: Dimension.Width10/2,),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(width: Dimension.Width10/2,),
                      GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add,color: AppColors.signColor,),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: Dimension.Height20,top:Dimension.Height20,left: Dimension.Height15,right:Dimension.Height15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      popularProduct.addItem(product);
                    },
                      child: BigText(text: '\$10 | Thêm vào giỏ hàng',),
                  ),
                ),
              ],
            ),
          );
        }),
    );
  }
}