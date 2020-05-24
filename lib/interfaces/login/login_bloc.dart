import 'dart:async';

import 'package:bloc/bloc.dart';

import 'login_extras.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {}
}
