
import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/controllers/popular_product_controller.dart';
import 'package:test_fluter/FoodDelivery/controllers/recommend_product_controller.dart';
import 'package:test_fluter/FoodDelivery/models/products_model.dart';
import 'package:test_fluter/FoodDelivery/src/cart/cart_page.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/expandable_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_product_controller.dart';
import '../../routes/routes_helper.dart';
import '../../utils/app_constants.dart';
import '../../widget/app_icon.dart';

class Recommended extends StatelessWidget{
  int pageId;
  String page;
  Recommended({Key? key,required this.pageId,required this.page}):super(key:key);

  @override
  Widget build(BuildContext context){
    var product = Get.find<RecommendProductController>().recommendProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartProductController>());
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
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
                      child: AppIcon(icon: Icons.arrow_back_ios,)
                  ),
                  GetBuilder<PopularProductController>(builder: (controller){
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(RouterHelper.getCartFood());
                          },
                          child: AppIcon(icon: Icons.shopping_cart,),
                        ),

                        Get.find<PopularProductController>().TotalItems >= 1? Positioned(right: 0,top: 0,child: AppIcon(icon: Icons.circle,size: 18,IconColor: AppColors.mainColor,)) : Container(),
                        Get.find<PopularProductController>().TotalItems >= 1? Positioned(
                          right: 3,top: 3,
                          child: BigText(text: Get.find<PopularProductController>().TotalItems.toString(),size: 11,color: Colors.white,),
                        ):Container(),
                      ],
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    ),
                    color: Colors.white,
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5,bottom: 10),
                  child: Center(child: BigText(text: product.name.toString(),size: Dimension.font26,)),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(AppConstants.BASE_URL+"/uploads/"+product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: Dimension.Width20,left: Dimension.Width20,bottom: Dimension.Height20),
                      child: ExpandableText(
                        text: product.description.toString()
                      ),
                  ),
                ],
              ),
            ),
          ]
      ),
      bottomNavigationBar:GetBuilder<PopularProductController>(builder: (controller){
        return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimension.Width30*2.5,
                  right: Dimension.Width30*2.5,
                  top: Dimension.Height10,
                  bottom: Dimension.Height10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(icon: Icons.remove,backgroundColor: AppColors.yellowColor,),
                  ),

                  BigText(text: "\$ ${product.price.toString()} "+" X "+" ${controller.inCartItems.toString()}"),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(icon: Icons.add,backgroundColor:AppColors.yellowColor),
                  ),
                ],
              ),
            ),
            Container(
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
                        Icon(Icons.favorite,color: AppColors.mainColor,),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: Dimension.Height20,top:Dimension.Height20,left: Dimension.Height15,right:Dimension.Height15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: BigText(text: '\$ ${product.price.toString()} | Thêm vào giỏ hàng',),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      })
    );
  }
}