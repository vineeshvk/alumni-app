import 'package:equatable/equatable.dart';

abstract class CollegeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCollegeEvent extends CollegeEvent {}

class AddCollegeEvent extends CollegeEvent {}

