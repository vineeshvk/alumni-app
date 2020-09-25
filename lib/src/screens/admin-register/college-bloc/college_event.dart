import 'package:equatable/equatable.dart';

abstract class CollegeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCollegeEvent extends CollegeEvent {
  @override
  String toString() => "GetCollegeEvent";
}

class AddCollegeEvent extends CollegeEvent {
  @override
  String toString() => "AddCollegeEvent";
}
