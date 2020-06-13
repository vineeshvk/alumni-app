import 'dart:async';

import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/authentication-bloc/user-repository.dart';
import 'package:alumni_app/src/register/bloc/register_event.dart';
import 'package:alumni_app/src/register/bloc/register_state.dart';
import 'package:alumni_app/src/register/models/register_input_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  final pageCtrl = PageController(initialPage: 0);

  RegisterInputModal registerInputs = new RegisterInputModal();

  RegisterBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  RegisterState get initialState => RegisterInitiated();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    try {
      if (event is RegisterButtonPressed) {
        yield* _mapRegisterButtonPressedEvent();
      } else if (event is EmailExistCheck) {
        yield* _mapEmailExistCheck();
      }
    } catch (error) {
      yield RegisterFailure(error: error.toString());
    }
  }

  Stream<RegisterState> _mapRegisterButtonPressedEvent() async* {
    yield RegisterLoading();

    final id = await userRepository.register(inputs: registerInputs);

    authenticationBloc.add(LoggedIn(data: id));
    
    yield RegisterInitiated();
  }

  Stream<RegisterState> _mapEmailExistCheck() async* {
    yield RegisterLoading();

    final data = await userRepository.hasSameEmail(email: registerInputs.email);

    if (data)
      yield RegisterFailure(error: "Email already exists");
    else
      yield EmailDoesNotExist(email: registerInputs.email);
  }
}
