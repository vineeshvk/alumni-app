import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {
  @override
  String toString() => "RegisterInitialState";
}

class RegisterLoadingState extends RegisterState {
  @override
  String toString() => "RegisterLoadingState";
}

class RegisterFailureState extends RegisterState {
  final String error;

  const RegisterFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterFailureState { error: $error }';
}

class EmailDoesNotExistState extends RegisterState {
  final String email;
  const EmailDoesNotExistState({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailDoesNotExistState { email: $email }';
}
