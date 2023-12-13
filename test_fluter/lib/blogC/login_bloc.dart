import 'dart:async';

import 'package:test_fluter/blogC/login_event.dart';
import 'package:test_fluter/blogC/login_state.dart';

class LoginBloc {
  final _stateBloc = StreamController<LoginState>();

  Stream<LoginState> get state =>  _stateBloc.stream;

  void send(LoginEvent event){
      switch(event) {
      case LoginEvent.login:
        _stateBloc.sink.add(LoginState.loading());
        Future.delayed( const Duration(seconds: 2), (){
          _stateBloc.sink.add(LoginState.success());
        });
    }
  }

  void dispose(){
    _stateBloc.close();
  }
}