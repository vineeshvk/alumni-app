import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/screens/home/bloc/app_event.dart';
import 'package:alumni_app/src/screens/home/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AuthenticationBloc authenticationBloc;
  AppBloc(this.authenticationBloc);

  @override
  AppState get initialState => AppInitialState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is LogoutButtonPressedEvent) {
      authenticationBloc.add(AuthenticationLoggedOutEvent());
    }
  }
}
