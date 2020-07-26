import 'package:equatable/equatable.dart';

abstract class AdminRegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AdminRegisterRequestEvent extends AdminRegisterEvent {
  @override
  String toString() => "AdminRegisterRequestEvent";
}
