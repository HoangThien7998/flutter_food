import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/src/account/account_page.dart';
import 'package:test_fluter/FoodDelivery/src/cart/cart_history.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'account/sign_up_page.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  int _selectIndex = 0;
  List page = [
    MainFoodPage(),
    SignUpPage(),
    CartHistory(),
    AccountPage()
  ];

  void onTapNav(int index){
    setState(() {
      _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.yellowColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label:"archive",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label:"shopping_cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:"person",
          ),
        ],
      ),
    );
  }

}