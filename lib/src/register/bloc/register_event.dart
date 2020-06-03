import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class EmailExistCheck extends RegisterEvent {
  final String email;

  const EmailExistCheck({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'RegisterEmailCheck { email: $email}';
}

class EmailCheckReset extends RegisterEvent {
  const EmailCheckReset();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final Map<String, String> inputs;

  const RegisterButtonPressed({@required this.inputs});

  @override
  List<Object> get props => [inputs];

  @override
  String toString() => 'RegisterButtonPressed { inputs: $inputs }';
}
