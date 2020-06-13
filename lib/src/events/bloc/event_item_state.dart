import 'package:alumni_app/src/events/models/event_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class EventItemState extends Equatable {}

class EventItemInitiated extends EventItemState {
  @override
  List<Object> get props => [];
}

class EventItemFetchLoading extends EventItemState {
  @override
  List<Object> get props => [];
}

class EventItemFetchSuccess extends EventItemState {
  final List<EventItemModel> events;

  EventItemFetchSuccess({@required this.events});

  @override
  List<Object> get props => [events];
}

class EventItemFetchFailure extends EventItemState {
  final String error;
  final bool isNetworkError;

  EventItemFetchFailure({@required this.error, this.isNetworkError = false});

  @override
  List<Object> get props => [error,isNetworkError];
}
