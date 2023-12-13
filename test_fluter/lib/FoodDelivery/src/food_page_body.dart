
import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:test_fluter/FoodDelivery/widget/icon_text.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../utils/dimensions.dart';

class FoodpageBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FoodpageBody();
}

class _FoodpageBody extends State<FoodpageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _heght = Dimension.pageViewFood;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }



  @override
  Widget build(BuildContext context){
    final decorator = new DotsIndicator(
      dotsCount: 5,
      position: _currPageValue,
      decorator: DotsDecorator(
        activeColor: AppColors.mainColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
    return Column(
      children: [
        Container(
          height: Dimension.pageViewFood,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context,position){
              return _buildPageItem(position);
            },
          ),
        ),
        decorator,
        SizedBox(height: Dimension.Height30,),
        Container(
          margin: EdgeInsets.only(left: Dimension.Width20,right: Dimension.Width20,top: Dimension.Height10),
          child: Row(
            children: [
              BigText(text: "Danh mục"),
              SizedBox(width: Dimension.Width10,),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: BigText(text: ".",color:Colors.black26),
              ),
              SizedBox(width: Dimension.Width10,),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: SmallText(text: "Đồ ăn và Đồ uống",),
              ),
            ],
          ),
        ),
        Container(
          height: 700,
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(left: Dimension.Width20,right:Dimension.Height20,bottom: Dimension.Height10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimension.radius15),
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('assets/img_food/food2.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(left: 10),
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimension.radius20),
                              bottomRight: Radius.circular(Dimension.radius20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "Món ăn Việt Nam",size: 18,),
                              SizedBox(height: Dimension.Height10,),
                              Row(children: [
                                Wrap(
                                  children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 12,)),
                                ),
                                SizedBox(width: Dimension.Width10,),
                                SmallText(text: '4.5',color: AppColors.textColor,),
                                SizedBox(width: Dimension.Width10,),
                                SmallText(text: '1287',color: AppColors.textColor,),
                                SizedBox(width: Dimension.Width10,),
                                SmallText(text: 'comments',color: AppColors.textColor,),
                              ],
                              ),
                              SizedBox(height: Dimension.Height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWigdet(icon: Icons.circle_sharp, text: "Normal", coloricon: AppColors.iconColor1),
                                  IconAndTextWigdet(icon: Icons.location_on, text: "1.7", coloricon: AppColors.mainColor),
                                  IconAndTextWigdet(icon: Icons.timer_rounded, text: "32 min", coloricon: AppColors.iconColor2),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
          ),
        )
      ],

    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var _currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var _currTrans = _heght*(1-_currScale)/2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(0, _currTrans, 0);
    }else if(index == _currPageValue.floor()+1){
      var _currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var _currTrans = _heght*(1-_currScale)/2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(1, _currTrans, 1);
    }else if(index == _currPageValue.floor()-1) {
      var _currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var _currTrans = _heght * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(1, _currTrans, 1);
    }else{
      var _currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(1, _heght*(1 - _currScale) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
            Container(
            height: Dimension.pageViewContrainer,
            margin: EdgeInsets.only(left: Dimension.Width10,right: Dimension.Width10,top: Dimension.Height10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: index.isEven?Colors.blue:Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      "assets/img_food/food1.png",
                    )
                )
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimension.Height120,
                margin: EdgeInsets.only(left: Dimension.Width30,right: Dimension.Width30,bottom: Dimension.Height20),
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.Height20),
                    color: index.isEven?Colors.white:Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0,5),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5,0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5,0),
                      ),
                    ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Món ăn Việt Nam"),
                    SizedBox(height: Dimension.Height10,),
                    Row(children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: Dimension.font18,)),
                      ),
                      SizedBox(width: Dimension.Height10,),
                      SmallText(text: '4.5',color: AppColors.textColor,),
                      SizedBox(width: Dimension.Height10,),
                      SmallText(text: '1287',color: AppColors.textColor,),
                      SizedBox(width: Dimension.Height10,),
                      SmallText(text: 'comments',color: AppColors.textColor,),
                    ],
                    ),
                    SizedBox(height: Dimension.Height10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWigdet(icon: Icons.circle_sharp, text: "Normal", coloricon: AppColors.iconColor1),
                        IconAndTextWigdet(icon: Icons.location_on, text: "1.7", coloricon: AppColors.mainColor),
                        IconAndTextWigdet(icon: Icons.timer_rounded, text: "32 min", coloricon: AppColors.iconColor2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
