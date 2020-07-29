import 'package:alumni_app/src/models/college_model.dart';
import 'package:alumni_app/src/respositories/college_respository.dart';
import 'package:alumni_app/src/screens/admin-register/college-bloc/college_event.dart';
import 'package:alumni_app/src/screens/admin-register/college-bloc/college_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollegeBloc extends Bloc<CollegeEvent, CollegeState> {
  CollegeBloc() : super(CollegeInitialState());

  @override
  Stream<CollegeState> mapEventToState(CollegeEvent event) async* {
    if (event is GetCollegeEvent) {
      yield* mapGetCollegeEventToState();
    }

    if (event is AddCollegeEvent) {
      yield* mapAddCollegeEventToState();
    }
  }

  Stream<CollegeState> mapGetCollegeEventToState() async* {
    try {
      yield GetCollegeLoadingState();

      List<CollegeModel> colleges = await CollegeRespository.getColleges();

      yield GetCollegeSuccessState(colleges: colleges);
    } catch (e) {
      yield GetCollegeFailureState(error: e);
    }
  }

  Stream<CollegeState> mapAddCollegeEventToState() async* {
    try {
      yield AddCollegeLoadingState();

      CollegeModel college = await CollegeRespository.addCollege();

      yield AddCollegeSuccessState(college: college);
    } catch (e) {
      yield AddCollegeFailureState(error: e);
    }
  }
}
