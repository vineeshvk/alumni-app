import 'package:alumni_app/src/models/event_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedInitialState extends FeedState {
  @override
  String toString() => "FeedInitialState";
}

class FeedFetchLoadingState extends FeedState {
  @override
  String toString() => "FeedFetchLoadingState";
}

class FeedFetchSuccessState extends FeedState {
  final List<FeedModel> events;

  FeedFetchSuccessState({@required this.events});

  @override
  List<Object> get props => [events];

  @override
  String toString() => "FeedFetchSuccessState";
}

class FeedFetchFailureState extends FeedState {
  final String error;
  final bool isNetworkError;

  FeedFetchFailureState({@required this.error, this.isNetworkError = false});

  @override
  List<Object> get props => [error, isNetworkError];

   
  @override
  String toString() => "FeedFetchFailureState";
}
