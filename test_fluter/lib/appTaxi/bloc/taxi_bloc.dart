import 'dart:async';

import 'package:flutter/material.dart';

import '../fire_base/fire_base_auth.dart';

class TaxiBloc{
  var firebasetaxi = FireAuth();

  StreamController _NameController = new StreamController();
  StreamController _EmailController = new StreamController();
  StreamController _PhoneController = new StreamController();
  StreamController _PassController = new StreamController();

  Stream get namesteam => _NameController.stream;
  Stream get emailsteam => _EmailController.stream;
  Stream get phonesteam => _PhoneController.stream;
  Stream get passsteam => _PassController.stream;

  bool Isvalidlogin(String name,String email,String phone,String pass){
    if(name == null || name.length == 0){
      _NameController.sink.addError("Họ Tên Không Hợp Lệ");
      return false;
    }
    _NameController.sink.add("");

    if((email == null|| email.length == 0 ||!email.contains("@"))){
      _EmailController.sink.addError("Email Không Hợp Lệ");
      return false;
    }
    _EmailController.sink.add("");


    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (phone.length == 0) {
      _PhoneController.sink.addError("Hãy nhập Số Điện Thoại");
      return false;
    }
    if (!regExp.hasMatch(phone)) {
      _PhoneController.sink.addError("Số Điện Thoại Không Hợp Lệ");
      return false;
    }
    _PhoneController.sink.add("");

    if(pass.length < 6){
      _PassController.sink.addError("Mật Khẩu Không Hợp Lệ");
      return false;
    }
    _PassController.sink.add("");

    return true;
  }

  void dangky(String name, String email, String phone, String pass, Function onSuccess, Function(String) onRegisterError){
    firebasetaxi.SignUp(email, pass, name, phone, onSuccess,onRegisterError);
  }

  void dangnhap(String email, String pass,Function onSuccess, Function(String) onRegisterError){
    firebasetaxi.SignIn(email, pass, onSuccess,onRegisterError);
  }

  void dispose(){
    _NameController.close();
    _EmailController.close();
    _PhoneController.close();
    _PassController.close();
  }
}