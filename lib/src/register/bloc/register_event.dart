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

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  const RegisterButtonPressed({
    @required this.email,
    @required this.password,
    @required this.name,
  });

  @override
  List<Object> get props => [email, password, name];

  @override
  String toString() =>
      'RegisterButtonPressed { email: $email, password: $password, name: $name }';
}
