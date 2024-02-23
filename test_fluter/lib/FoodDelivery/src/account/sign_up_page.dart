
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/big_text.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_message.dart';
import '../../controllers/auth_controller.dart';
import '../../models/signup_body_model.dart';
import '../../widget/app_text_field.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var SignUpImages = ["f.png","g.png","t.png"];

    void register(AuthController authController){
      String email = emailController.text.trim();
      String pass = passController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Họ và tên không được rỗng",title: "Họ và tên");
      }else if(phone.isEmpty){
        showCustomSnackBar("SĐT không được rỗng",title: "Số điện thoại");
      }else if(email.isEmpty){
        showCustomSnackBar("Email không được rỗng",title: "Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Email không đúng định dạng",title: "Email");
      }else if(pass.isEmpty){
        showCustomSnackBar("Mật khẩu không đúng định dạng",title: "Password");
      }else if(pass.length < 6){
        showCustomSnackBar("Mật khẩu không nhỏ hơn 6 kí tự",title: "Password");
      }else{
        showCustomSnackBar("Tạo thành công",title: "Perfect");
        SignUpBody signUpBody =  SignUpBody(name:name,phone:phone,email:email,password:phone);
        print(signUpBody.toString());
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("Dang ký thanh cong");
          }else{
            showCustomSnackBar(status.message,title: "Fail");
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading?SingleChildScrollView(
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
              AppTextField(textController: emailController,icon: Icons.email,hintText: "Email",type: TextInputType.emailAddress),
              SizedBox(height: Dimension.Height10,),
              AppTextField(textController: passController,icon: Icons.password,hintText: "Mật khẩu",type: TextInputType.visiblePassword,HintPass: true,),
              SizedBox(height: Dimension.Height10,),
              AppTextField(textController: nameController,icon: Icons.person,hintText: "Họ và tên",type: TextInputType.name),
              SizedBox(height: Dimension.Height10,),
              AppTextField(textController: phoneController,icon: Icons.phone,hintText: "Số điện thoại",type: TextInputType.phone,),
              SizedBox(height: Dimension.Height30,),
              GestureDetector(
                onTap: (){
                  register(_authController);
                },
                child: Container(
                  width: Dimension.screenWidth/2,
                  height: Dimension.screenWidth/6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(text: "Đăng ký",size: 28,color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: Dimension.Height10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=> Get.back(),
                  text: "Đã có tài khoản rồi?",
                  style: TextStyle(color: Colors.grey[500],
                      fontSize: Dimension.font20)
              )),
              SizedBox(height: Dimension.Height10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=> Get.back(),
                  text: "Đăng nhập bằng cách khác",
                  style: TextStyle(color: Colors.grey[500],
                      fontSize: Dimension.font20)
              )),
              Wrap(
                  children: List.generate(3, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: Dimension.radius20,
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/img_food/"+SignUpImages[index],fit: BoxFit.fill,),
                    ),
                  ),)
              ),
            ],
          ),
        ):CustomLoader();
      })
    );
  }

}