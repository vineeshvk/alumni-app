import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final dynamic data;

  const LoggedIn({@required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'LoggedIn { data: $data }';
}

class LoggedOut extends AuthenticationEvent {}
