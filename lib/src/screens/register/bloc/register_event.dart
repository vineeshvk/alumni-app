import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckEmailExistEvent extends RegisterEvent {
  @override
  String toString() => 'CheckEmailExistEvent';
}

class RegisterButtonPressedEvent extends RegisterEvent {
  @override
  String toString() => 'RegisterButtonPressedEvent';
}
