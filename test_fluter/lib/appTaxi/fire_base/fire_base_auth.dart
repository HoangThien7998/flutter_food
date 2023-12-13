import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void SignUp(String email, String pass, String name, String phone, Function onSuccess,Function(String) onRegisterError){

  _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass).then((user){
      _createUser(user.user!.uid,name,phone,onSuccess,onRegisterError);

    }).catchError((err){
      _onSingUpErr(err.code,onRegisterError);
    });
  }

  _createUser(String userId, String name,String phone, Function onSuccess, Function(String) onRegisterError){
    var userdata = {"name": name,"phone": phone};
    var ref = FirebaseDatabase.instance.ref().child("user");
    ref.child(userId).set(userdata).then((user){
      onSuccess();
      print("successs");
    }).catchError((err){
      onRegisterError("Đăng ký thất bại");
    });
  }

  void SignIn(String Email,String Pass ,Function onSuccess ,Function(String) onRegisterError){
    _firebaseAuth.signInWithEmailAndPassword(email: Email, password: Pass).then((user) {
      onSuccess();
    }).catchError((err){
      onRegisterError("đăng nhập thất bại");
    });
  }

  void _onSingUpErr(String code,Function(String) onRegisterError){
    switch(code){
      case "email-already-in-use":
        onRegisterError("email đã thực sự tồn tại");
        break;
      case "invalid-email":
        onRegisterError("email không đúng giá trị");
        break;
      case "weak-password":
        onRegisterError("Mật khẩu không đủ mạnh");
        break;
      default:
        onRegisterError("Đăng ký thất bại");
        break;
    }
  }

}