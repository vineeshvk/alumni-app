import 'package:equatable/equatable.dart';

class AdminRegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class AdminRegisterInitialState extends AdminRegisterState {
  @override
  String toString() => "AdminRegisterInitialState";
}

class AdminRegisterLoadingState extends AdminRegisterState {
  @override
  String toString() => "AdminRegisterLoadingState";
}

class AdminRegisterFailureState extends AdminRegisterState {
  final String error;

  AdminRegisterFailureState({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "AdminRegisterFailureState";
}
