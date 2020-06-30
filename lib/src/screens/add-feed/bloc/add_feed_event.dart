import 'package:equatable/equatable.dart';

abstract class AddFeedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddNewFeedEvent extends AddFeedEvent {
  @override
  String toString() => "AddNewFeedEvent";
}

