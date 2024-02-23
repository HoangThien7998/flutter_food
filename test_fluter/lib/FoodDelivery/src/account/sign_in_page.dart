
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/routes/routes_helper.dart';
import 'package:test_fluter/FoodDelivery/src/account/sign_up_page.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:get/get.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';

import '../../base/show_custom_message.dart';
import '../../controllers/auth_controller.dart';
import '../../models/signup_body_model.dart';
import '../../widget/app_text_field.dart';

class SignInPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var passController = TextEditingController();
    var emailController = TextEditingController();
    void loginController(AuthController authController){

      String email = emailController.text.trim();
      String pass = passController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar("Email không được rỗng",title: "Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Email không đúng định dạng",title: "Email");
      }else if(pass.isEmpty){
        showCustomSnackBar("Mật khẩu không đúng định dạng",title: "Password");
      }else if(pass.length < 6){
        showCustomSnackBar("Mật khẩu không nhỏ hơn 6 kí tự",title: "Password");
      }else{
        showCustomSnackBar("Tạo thành công",title: "Perfect");


        authController.login(email,pass).then((status){
          if(status.isSuccess){
            Get.toNamed(RouterHelper.getInitial());
          }else{
            showCustomSnackBar(status.message,title: "Fail");
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_logincontroller){
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimension.Height45,),
              Container(
                child: Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/img_food/foodlogo.png",fit: BoxFit.fill,),
                  ),
                ),
              ),
              SizedBox(height: Dimension.Height20,),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Xin Chào",style: TextStyle(fontSize: Dimension.font20*2+Dimension.font20/2,fontWeight: FontWeight.bold),),
                    SmallText(text:"Điều thông tin tài khoản",size: 20,)
                  ],
                ),
              ),
              SizedBox(height: Dimension.Height20,),
              AppTextField(textController: emailController,icon: Icons.email,hintText: "Email",type: TextInputType.emailAddress),
              SizedBox(height: Dimension.Height10,),
              AppTextField(textController: passController,icon: Icons.password,hintText: "Mật khẩu",type: TextInputType.visiblePassword,HintPass: true,),
              SizedBox(height: Dimension.Height10,),
              Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 220),
                  child: SmallText(text: "Điền thông tin tài khoản",size: 16,)
              ),
              SizedBox(height: Dimension.Height30,),
              Container(
                width: Dimension.screenWidth/2,
                height: Dimension.screenWidth/6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: AppColors.mainColor
                ),
                child: GestureDetector(
                  onTap: (){
                    loginController(_logincontroller);
                  },
                  child: Center(
                    child: BigText(text: "Đăng Nhập",size: 28,color: Colors.white,),
                  ),
                ),
              ),

              SizedBox(height: Dimension.screenHeight*0.2,),
              RichText(text: TextSpan(
                text: "Không có tài khoản? ",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimension.font20),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=> Get.to(SignUpPage(),transition: Transition.fade),
                      text: " Tạo tài khoản",
                      style: TextStyle(color: Colors.black,
                          fontSize: Dimension.font20)
                  )
                ],
              )),
            ],
          ),
        );
      })

    );
  }

}