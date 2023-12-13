import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_fluter/appTaxi/src/dialog/loading_dialog.dart';
import 'package:test_fluter/appTaxi/src/register_taxi.dart';

import '../bloc/taxi_bloc.dart';
import 'dialog/msg_dialog.dart';
import 'home_taxi.dart';


class Screenlogin extends StatefulWidget{
  @override
  State<Screenlogin> createState() => _Screerlogin();
}

class _Screerlogin extends State<Screenlogin> {
  var taxibloc = TaxiBloc();

  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset("assets/car_green.png",width: 300,
                      height: 150,
                      fit:BoxFit.cover),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Welcome !",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                ),
                Text("Login to continue using iCar",style: TextStyle(fontSize: 18),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
                  child: TextField(
                    style: TextStyle(fontSize: 18,color: Colors.black),
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: TextField(
                    style: TextStyle(fontSize: 18,color: Colors.black),
                    controller: _passcontroller,
                    obscureText:true,
                    decoration: InputDecoration(
                        labelText: "PassWord",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
                    child: Text("Forgot password?",style: TextStyle(fontSize: 15,color: Colors.grey),),
                  ),),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){_Login();},
                        child: Text("Login",style: TextStyle(fontSize: 18)),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'New user?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            decorationStyle: TextDecorationStyle.wavy,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTaxi()));
                          },
                          text: ' Sign up for a new account',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            decorationStyle: TextDecorationStyle.wavy,
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _Login() {
    String email = _emailcontroller.text;
    String pass = _passcontroller.text;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    taxibloc.dangnhap(email, pass, (){
      LoadingDialog.hideLoadingDialog(context);
      Navigator.push(context, MaterialPageRoute(builder: GoHome));
    }, (msg){
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign-In", msg);
    });
  }

  Widget GoHome(BuildContext context){
    return HomeTaxi();
  }
}