import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_fluter/appTaxi/src/dialog/loading_dialog.dart';
import 'package:test_fluter/appTaxi/src/dialog/msg_dialog.dart';

import '../../login/resource/pagesecond.dart';
import '../bloc/taxi_bloc.dart';
import 'login_taxi.dart';

class RegisterTaxi extends StatefulWidget{
  @override
  State<RegisterTaxi> createState() => _RegisterTaxi();

}

class _RegisterTaxi extends State<RegisterTaxi>{
  var taxibloc = TaxiBloc();

  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();
  TextEditingController _passcontroller = new TextEditingController();

  void onSubmit(){
    var isValid = taxibloc.Isvalidlogin(_namecontroller.text, _emailcontroller.text,_phonecontroller.text,_passcontroller.text);

    if(isValid){
      //create use
      //loading dialog
      LoadingDialog.showLoadingDialog(context, "Loadding...");
      taxibloc.dangky(_namecontroller.text, _emailcontroller.text, _phonecontroller.text, _passcontroller.text, (){
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context, MaterialPageRoute(builder: GoLogin));
      },(msg){
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "Sign-In", msg);
        //show msg
      });
    }
  }

  Widget GoLogin(BuildContext context){
    return Screenlogin();
  }

  @override
  void dispose(){
    taxibloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/car_red.png",width: 300,
                    height: 150,
                    fit:BoxFit.fitWidth),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text("Welcome Register!",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              ),
              Text("Singup with iCab in simple step",style: TextStyle(fontSize: 18),),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
                child: StreamBuilder(
                  stream: taxibloc.namesteam,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _namecontroller,
                      style: TextStyle(fontSize: 18,color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          labelText: "Name",
                          prefixIcon: Icon(Icons.account_circle_rounded),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          )
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: StreamBuilder(
                  stream: taxibloc.emailsteam,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailcontroller,
                      style: TextStyle(fontSize: 18,color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          )
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: StreamBuilder(
                  stream: taxibloc.phonesteam,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _phonecontroller,
                      style: TextStyle(fontSize: 18,color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          )
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: StreamBuilder(
                  stream: taxibloc.passsteam,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _passcontroller,
                      style: TextStyle(fontSize: 18,color: Colors.black),
                      obscureText:true,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          labelText: "PassWord",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          )
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){onSubmit();},
                      child: Text("Register",style: TextStyle(fontSize: 18),),
                    )
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already a user?',
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
                                Navigator.pop(context);
                            },
                          text: ' Login now',
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
    );
  }

}
