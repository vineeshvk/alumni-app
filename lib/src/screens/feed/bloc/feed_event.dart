import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFeedEvent extends FeedEvent {
  @override
  String toString() => "FetchFeedEvent";
}
