import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {
  @override
  String toString() => "AppInitialState";
}

class AppStartedState extends AppState{
  @override
  String toString() => "AppStartedState";
}