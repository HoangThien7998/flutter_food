
import 'dart:async';

import '../validate/login_validate.dart';

class LoginBlocclone {
  StreamController _UserController = new StreamController();
  StreamController _PassController = new StreamController();

  Stream get userStream => _UserController.stream;
  Stream get passStream => _PassController.stream;

  bool isValidInfor(String user,String pass){
    if(!LoginValidate.isValidUser(user)){
      _UserController.sink.addError("Tài Khoản Không Hợp Lệ");
      return false;
    }
    _UserController.sink.add("OK");

    if(!LoginValidate.isValidPass(pass)){
      _PassController.sink.addError("Mật Khẩu Không Hợp Lệ");
      return false;
    }
    _PassController.sink.add("OK");

    return true;
  }

  void dispose(){
    _UserController.close();
    _PassController.close();
  }
}