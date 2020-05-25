import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterState {
  RegisterState();

  factory RegisterState.fromPrev({@required RegisterState prevState}) {
    if (prevState == null) {
      return RegisterState();
    } else {
      return RegisterState();
    }
  }
}
