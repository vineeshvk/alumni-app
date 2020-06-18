import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class EmailExistCheck extends RegisterEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterEmailCheck';
}

class RegisterButtonPressed extends RegisterEvent {
  const RegisterButtonPressed();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterButtonPressed';
}
