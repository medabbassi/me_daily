import 'dart:async';

import 'package:bloc/bloc.dart';

import 'register_extras.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => RegisterState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {}
}
