import 'package:alumni_app/src/models/event_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedInitiatedState extends FeedState {
  @override
  String toString() => "FeedInitiatedState";
}

class FeedFetchLoading extends FeedState {
  @override
  String toString() => "FeedInitiatedState";
}

class FeedFetchSuccess extends FeedState {
  final List<FeedModel> events;

  FeedFetchSuccess({@required this.events});

  @override
  List<Object> get props => [events];
}

class FeedFetchFailure extends FeedState {
  final String error;
  final bool isNetworkError;

  FeedFetchFailure({@required this.error, this.isNetworkError = false});

  @override
  List<Object> get props => [error, isNetworkError];
}
