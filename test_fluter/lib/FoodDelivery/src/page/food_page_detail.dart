import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/widget/app_icon.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/expandable_text.dart';

import '../../utils/dimensions.dart';
import '../../widget/app_column.dart';

class FoodPageDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FoodPageDetail();

}

class _FoodPageDetail extends State<FoodPageDetail> {

  @override
  Widget build(BuildContext context){
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
                    image: AssetImage('assets/img_food/food_6.jpg'),
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
                    AppIcon(icon: Icons.arrow_back_ios,),
                    AppIcon(icon: Icons.shopping_cart,),
                  ],
                )
            ),
            Positioned(
                top: Dimension.FoodImgSize - 60,
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
                      AppColumn(text: "Món Ăn Hàn Quốc",size: 26),
                      SizedBox(height: Dimension.Height30,),
                      BigText(text: "Giới Thiệu Món Ăn",size: 26),
                      Expanded(child: SingleChildScrollView(child: ExpandableText(text: "Không chỉ ở Việt Nam, mà tại rất nhiều quốc gia trên thế giới đều có sự xuất hiện của những phố ẩm thực Hàn Quốc. Không nổi tiếng như ẩm thực Ý. Không quá sang chảnh như ẩm thực Pháp. Không quá cầu kỳ như ẩm thực Nhật Bản. Và không sử dụng nhiều gia vị như ẩm thực Ấn Độ… Nhưng phong cách ẩm thực Hàn Quốc luôn ghi điểm bằng sự tinh tế trong đơn giản.",)))

                    ],
                  ),)
            ),
          ],
        ),
        bottomNavigationBar: Container(
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
                    Icon(Icons.remove,color: AppColors.signColor,),
                    SizedBox(width: Dimension.Width10/2,),
                    BigText(text: "0"),
                    SizedBox(width: Dimension.Width10/2,),
                    Icon(Icons.add,color: AppColors.signColor,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: Dimension.Height20,top:Dimension.Height20,left: Dimension.Height15,right:Dimension.Height15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: AppColors.mainColor,
                ),
                child: BigText(text: '\$10 | Thêm vào giỏ hàng',),
              ),
            ],
          ),
        ),
    );
  }
}