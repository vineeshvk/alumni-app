import 'dart:async';

import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/authentication-bloc/user-repository.dart';
import 'package:alumni_app/src/login/bloc/login_event.dart';
import 'package:alumni_app/src/login/bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.login(
          email: event.email,
          password: event.password,
        );

        if (token != null) {
          authenticationBloc.add(LoggedIn(data: {"token": token}));
          yield LoginInitial();
        } else {
          yield LoginFailure(error: "Login Failed");
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
