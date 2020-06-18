import 'package:equatable/equatable.dart';

abstract class EventItemEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchEventItems extends EventItemEvent {
  @override
  String toString() => "FetchEvenItems";
}
