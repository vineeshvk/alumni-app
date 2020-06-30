import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileLogoutEvent extends ProfileEvent {
  @override
  String toString() => "LogoutEvent";
}
