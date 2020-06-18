import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  @override
  String toString() => 'LoginButtonPressedEvent';
}
