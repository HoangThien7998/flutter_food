import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_fluter/blogC/login_bloc.dart';
import 'package:test_fluter/blogC/login_event.dart';
import 'package:test_fluter/provider/couter_provider.dart';
import 'package:get/get.dart';
import '../blogC/login_state.dart';


class MaterialBloc extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreen();

}

class _LoginScreen extends State<LoginScreen>{

  var loginbloc = LoginBloc();

  onPressed(){
    loginbloc.send(LoginEvent.login);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
            initialData: LoginState.initial(),
            stream: loginbloc.state,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(snapshot.data!.isLoading)
                    CircularProgressIndicator()
                  else if(snapshot.data!.isFail)
                    Text("Login thất bại")
                  else
                    Text("Login thành công ${snapshot.data!.isSuccess}"),
                  ElevatedButton(onPressed: (){onPressed();}, child: Text("Login"))
                ],

              );}
        ),
      ),
    );
  }

}


class MaterialGetx extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(home: TestGetX(),);
  }
}

class Couter extends GetxController {
  RxInt dem = 0.obs;

  void add(){
    dem++;
  }
}

class TestGetX extends StatelessWidget{
  final countergetx = Get.put(Couter());
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST GETX"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('${countergetx.dem}',style: TextStyle(fontSize: 50),)),
              ElevatedButton(onPressed: (){
                Get.to(TrangSecond());
              }, child: Text("Chuyển trang"))
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countergetx.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TrangSecond extends StatelessWidget{
  final Couter othercounter = Get.find();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("GETX 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${othercounter.dem}',style: TextStyle(fontSize: 50),)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          othercounter.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Material extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CouterProvider()),
      ChangeNotifierProvider(create: (context) => GioiTinh()),
      ChangeNotifierProvider(create: (context) => BangCap()),
    ],child: MaterialApp(
      home: ProviderTest2(),
    ),
    );
  }
}

class ProviderTest2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Appbar"),
      ),
      body: Consumer2<GioiTinh,BangCap>(builder: (context,infogioitinh,infobangcap,child){
        return Column(
          children: [
            Text("Giới tính"),
            RadioListTile<gioi_tinh>(
                value: gioi_tinh.nam,
                title: Text("Nam"),
                groupValue: infogioitinh.gioiTinh,
                onChanged: (value){
                  infogioitinh.gioiTinh = value;
                }),
            RadioListTile<gioi_tinh>(
                value: gioi_tinh.nu,
                title: Text("Nữ"),
                groupValue: infogioitinh.gioiTinh,
                onChanged: (value){
                  infogioitinh.gioiTinh = value;
                }),
            Text("Giới tính: ${infogioitinh.gioiTinh}"),
          ],
        );
      },
      ),
    );
  }
}

class ProviderTest1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("AppBar"),),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<CouterProvider>().value.toString(),style: TextStyle(fontSize: 24),),
            ElevatedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (_) => SecondPage()));
            },
                child: Text("Đi tới trang khác")),
          ],
        ),

      ),
      floatingActionButton:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: (){
              context.read<CouterProvider>().incrementCouter();
            },
            heroTag: "btn_add_1",
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              context.read<CouterProvider>().decrementCouter();
            },
            heroTag: "btn_remove_1",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,title: Text("AppBar"),),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context
                .watch<CouterProvider>()
                .value
                .toString(), style: TextStyle(fontSize: 24),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            },
                child: Text("Trờ về trang chủ")),
          ],
        ),

      ),
      floatingActionButton:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CouterProvider>().incrementCouter();
            },
            heroTag: "btn_add",
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {
              context.read<CouterProvider>().decrementCouter();
            },
            heroTag: "btn_remove",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class ProviderTest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(context.watch<CouterProvider>().value.toString()
          ,style: TextStyle(fontSize: 24),),
      ),
      floatingActionButton:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: (){
              context.read<CouterProvider>().incrementCouter();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              context.read<CouterProvider>().decrementCouter();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class SnackBarTest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('Hello world'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          SnackBar snackbar = SnackBar(content: Text('Test Snackbar'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            ),
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.fixed,

          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);

        },
        child: Icon(Icons.access_time_rounded),
      ),
    );
  }
}

class GridTest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        shrinkWrap: true,
        children: [
          Container(color: Colors.amber,),
          Container(color: Colors.pinkAccent,),
          Container(color: Colors.green,),
          for(var i = 0;i < 50; i++ ) Container(color: Colors.green,)
        ],
      ),
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _gioitinh = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Học Futer'),
        ),
        endDrawer: Drawer(
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context);
          },
              child: Text("OK")),
        ),
        body: Container(
          child: Column(
            children: [
              RadioListTile(
                  title: Text("Bê-Đê"),
                  value: 0,
                  groupValue: _gioitinh,
                  onChanged: (value){
                    setState(() {
                      _gioitinh = int.parse(value.toString());
                    });
                  }),
              RadioListTile(
                  title: Text("Chị"),
                  value: 1,
                  groupValue: _gioitinh,
                  onChanged: (value){
                    setState(() {
                      _gioitinh = int.parse(value.toString());
                    });
                  }),
              RadioListTile(
                  title: Text("Anh"),
                  value: 2,
                  groupValue: _gioitinh,
                  onChanged: (value){
                    setState(() {
                      _gioitinh = int.parse(value.toString());
                    });
                  })
            ],
          ),
        )
    );
  }
}