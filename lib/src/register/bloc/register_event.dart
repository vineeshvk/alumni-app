import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
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
      'RegisterButtonPressed { email: $email, password: $password, name: 2$name }';
}
