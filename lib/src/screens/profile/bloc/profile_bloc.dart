import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/screens/profile/bloc/profile_event.dart';
import 'package:alumni_app/src/screens/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthenticationBloc _authenticationBloc;
  ProfileBloc(this._authenticationBloc);

  @override
  ProfileState get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileLogoutEvent) {
      _authenticationBloc.add(AuthenticationLoggedOutEvent());
    }
  }
}
