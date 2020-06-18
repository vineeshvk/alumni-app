import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/utils/preference_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      yield* _mapAppStartEventToState();
    }

    if (event is AuthenticationLoggedInEvent) {
      yield AuthenticationLoggedInState();
    }

    if (event is AuthenticationLoggedOutEvent) {
      print("from loggout event");
      await PreferenceHelper.removeToken();
      yield AuthenticationLoggedOutState();
    }
  }

  Stream<AuthenticationState> _mapAppStartEventToState() async* {
    final hasToken = await PreferenceHelper.hasToken();
    if (hasToken)
      yield AuthenticationLoggedInState();
    else
      yield AuthenticationLoggedOutState();
  }
}
