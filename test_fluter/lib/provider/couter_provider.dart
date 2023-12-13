import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CouterProvider extends ChangeNotifier{
  int value;
  CouterProvider({
    this.value = 0,
  });
  void incrementCouter(){
    value++;
    notifyListeners();
  }

  void decrementCouter(){
    value--;
    notifyListeners();
  }
}

enum gioi_tinh {nam,nu}

class GioiTinh extends ChangeNotifier{
  gioi_tinh? _gioitinh = gioi_tinh.nam;

  gioi_tinh? get gioiTinh => _gioitinh;

  set gioiTinh(gioi_tinh? value){
    _gioitinh = value;
    notifyListeners();
  }
}

enum bang_cap {trungcap, caodang, daihoc, caohoc}

class BangCap extends ChangeNotifier{
  bang_cap _bangcap = bang_cap.trungcap;

  bang_cap get bangCap => _bangcap;

  set bangCap(bang_cap value){
    _bangcap = value;
    notifyListeners();
  }
}