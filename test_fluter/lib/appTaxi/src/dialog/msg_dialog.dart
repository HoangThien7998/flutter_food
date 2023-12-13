import 'package:flutter/material.dart';

class MsgDialog{
  static void showMsgDialog(BuildContext context,String title,String msg){
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(MsgDialog);
            },child: Text("OK"),),
          ],
        )
    );
  }
}