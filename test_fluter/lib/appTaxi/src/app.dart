import 'package:flutter/material.dart';

import '../bloc/taxi_bloc.dart';
import 'login_taxi.dart';

class Myapp_taxi extends InheritedWidget{
  final TaxiBloc taxiBloc;
  final Widget child;

  Myapp_taxi(this.taxiBloc, this.child) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw false;
  }

  static Myapp_taxi of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Myapp_taxi>()!;

}