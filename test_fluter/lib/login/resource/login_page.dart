import 'package:flutter/material.dart';
import 'package:test_fluter/login/resource/pagesecond.dart';
import '../bloc/login_bloc.dart';


class ScreenLogin extends StatefulWidget{
  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {

  bool _showPass = false;
  var loginbloc = LoginBlocclone();


  TextEditingController _usernamecontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  var _MessErrUser = "Tài Khoản Không Hợp Lệ";
  var _MessErrPass = "Mật Khẩu Không Hợp Lệ";
  bool _UserInvalid = false;
  bool _PassInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30,0,30,0),
          child: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,20),
                  child: Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd8d8d8)
                    ),
                    child: FlutterLogo(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,50),
                  child: Text("Hello\nWelcome Back" ,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,20),
                    child: StreamBuilder(
                      stream: loginbloc.userStream,
                      builder: (context, snapshot) =>
                        TextField(
                          controller: _usernamecontroller,
                          decoration: InputDecoration(
                              errorText: snapshot.hasError ? snapshot.error.toString() : null,
                              labelText: "USERNAME",
                              labelStyle: TextStyle(color: Colors.black,fontSize: 15)
                          ),
                          style: TextStyle(fontSize: 23),
                        ),
                    ),
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,20),
                        child:
                        StreamBuilder(
                          stream: loginbloc.passStream,
                          builder: (context,snapshot) => TextField(
                            controller: _passwordcontroller,
                            obscureText: !_showPass,
                            decoration: InputDecoration(
                                labelText: "PASSWORD",
                                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                labelStyle: TextStyle(color: Colors.black,fontSize: 15)
                            ),
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(_showPass? "Hide" : "Show",style: TextStyle(fontSize: 16,color: Colors.cyan),),),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          onSubmit();
                        },
                        child: Text("Submit",style: TextStyle(fontSize: 18,),
                        )
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('NEW USER? SIGN UP',style: TextStyle(fontSize: 15,color: Colors.blueAccent)),
                        Text('FORGOT PASSWORD?',style: TextStyle(fontSize: 15,color: Colors.blueAccent),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSubmit(){
    if(loginbloc.isValidInfor(_usernamecontroller.text, _passwordcontroller.text)){
      Navigator.push(context, MaterialPageRoute(builder: GoHome));
    }
  }

  Widget GoHome(BuildContext context){
    return HomePage();
  }
}