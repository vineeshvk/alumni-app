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

  LoginBloc(this.authenticationBloc) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();

      try {
        final response = await LoginRepository.login(
          emailController.text,
          passwordController.text,
        );

        if (response.error == null) {
          await PreferenceHelper.saveToken(response.user);
          authenticationBloc.add(AuthenticationLoggedInEvent());
          yield LoginInitialState();
        } else {
          yield LoginFailureState(error: response.error);
        }
      } catch (error) {
        yield LoginFailureState(error: error.toString());
      }
    }
  }
}
