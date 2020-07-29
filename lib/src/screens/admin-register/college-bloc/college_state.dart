import 'package:alumni_app/src/models/college_model.dart';
import 'package:equatable/equatable.dart';

abstract class CollegeState extends Equatable {
  @override
  List<Object> get props => [];
}

class CollegeInitialState extends CollegeState {
  @override
  String toString() => "CollegeInitialState";
}

class GetCollegeLoadingState extends CollegeState {
  @override
  String toString() => "GetCollegeLoadingState";
}

class GetCollegeSuccessState extends CollegeState {
  final List<CollegeModel> colleges;

  GetCollegeSuccessState({this.colleges});

  @override
  List<Object> get props => [colleges];

  @override
  String toString() => "GetCollegeSuccessState";
}

class GetCollegeFailureState extends CollegeState {
  final String error;

  GetCollegeFailureState({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "GetCollegeFailureState";
}

class AddCollegeLoadingState extends CollegeState {
  @override
  String toString() => "AddCollegeLoadingState";
}

class AddCollegeSuccessState extends CollegeState {
  final CollegeModel college;

  AddCollegeSuccessState({this.college});

  @override
  List<Object> get props => [college];

  @override
  String toString() => "AddCollegeSuccessState";
}

class AddCollegeFailureState extends CollegeState {
  final String error;

  AddCollegeFailureState({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "AddCollegeFailureState";
}
