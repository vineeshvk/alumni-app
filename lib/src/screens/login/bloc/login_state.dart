import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  String toString() => "LoginInitialState";
}

class LoginLoadingState extends LoginState {
  @override
  String toString() => "LoginLoadingState";
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({@required this.error});

  @override
  String toString() => 'LoginFailure { error: $error }';
}
