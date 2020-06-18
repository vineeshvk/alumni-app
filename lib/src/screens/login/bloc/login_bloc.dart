import 'dart:async';

import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/respositories/login_repository.dart';
import 'package:alumni_app/src/screens/login/bloc/login_event.dart';
import 'package:alumni_app/src/screens/login/bloc/login_state.dart';
import 'package:alumni_app/src/utils/preference_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  LoginBloc(this.authenticationBloc);

  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();

      try {
        final token = await LoginRepository.login(
          emailController.text,
          passwordController.text,
        );

        if (token.error == null) {
          await PreferenceHelper.saveToken(token.user.id);
          authenticationBloc.add(AuthenticationLoggedInEvent());
          yield LoginInitialState();
        } else {
          yield LoginFailureState(error: token.error);
        }
      } catch (error) {
        yield LoginFailureState(error: error.toString());
      }
    }
  }
}
