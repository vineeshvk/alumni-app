import 'package:equatable/equatable.dart';
import "package:meta/meta.dart";

abstract class AddFeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFeedInitialState extends AddFeedState {
  @override
  String toString() => "AddFeedInitialState";
}

class AddFeedLoadingState extends AddFeedState {
  @override
  String toString() => "AddFeedLoadingState";
}

class AddFeedSuccessState extends AddFeedState {
  @override
  String toString() => "AddFeedSuccessState";
}

class AddFeedFailureState extends AddFeedState {
  final String error;

  AddFeedFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "AddFeedFailureState {error : $error}";
}
