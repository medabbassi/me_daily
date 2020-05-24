import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class LoginEvent extends Equatable {}

class LoginState {
  LoginState();

  factory LoginState.fromPrev({@required LoginState prevState}) {
    if (prevState == null) {
      return LoginState();
    } else {
      return LoginState();
    }
  }
}
