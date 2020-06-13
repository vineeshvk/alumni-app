import 'package:equatable/equatable.dart';

abstract class EventItemEvent extends Equatable {
  const EventItemEvent();
}

class FetchEventItems extends EventItemEvent {
  @override
  List<Object> get props => [];
}


