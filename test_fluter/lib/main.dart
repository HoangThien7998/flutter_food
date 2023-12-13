import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_core/firebase_core.dart';
import 'FoodDelivery/src/main_food_page.dart';
import 'package:get/get.dart';
import 'FoodDelivery/src/page/food_page_detail.dart';
import 'appTaxi/src/app.dart';
import 'appTaxi/src/login_taxi.dart';
import 'appTaxi/bloc/taxi_bloc.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: FirebaseOptions(
      apiKey: "AIzaSyBVudHO3DxS7TVrn1SYzNzsFXoqZXQ4VMo",
      appId: "1:379935375014:android:e0d6344162480c5ed0be67",
      messagingSenderId: "379935375014",
      projectId: "taxiapp-1f1f0",
    ),
  );

  // runApp(Myapp_taxi(new TaxiBloc(),MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Screenlogin(),
  //
  // )));

  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainFoodPage(),
        home: FoodPageDetail(),
      )
  );
}



