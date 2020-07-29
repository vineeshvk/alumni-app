import 'dart:async';

import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/respositories/register_repository.dart';
import 'package:alumni_app/src/screens/register/bloc/register_event.dart';
import 'package:alumni_app/src/screens/register/bloc/register_state.dart';
import 'package:alumni_app/src/utils/preference_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationBloc authenticationBloc;

  String selectedDegree = "";

  //TextField Controllers
  final emailCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final collegeCtrl = TextEditingController();
  final registerNoCtrl = TextEditingController();
  final batchCtrl = TextEditingController();
  final majorCtrl = TextEditingController();

  final pageCtrl = PageController();

  RegisterBloc(this.authenticationBloc) : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    try {
      if (event is RegisterButtonPressedEvent) {
        yield* _mapRegisterButtonPressedEvent();
      } else if (event is CheckEmailExistEvent) {
        yield* _mapEmailExistCheck();
      }
    } catch (error) {
      yield RegisterFailureState(error: error.toString());
    }
  }

  Stream<RegisterState> _mapRegisterButtonPressedEvent() async* {
    yield RegisterLoadingState();

    final token = await ResgisterRepository.register(
      email: emailCtrl.text,
      password: passwordCtrl.text,
      name: nameCtrl.text,
      dob: dobCtrl.text,
      gender: genderCtrl.text,
      collegeId: collegeCtrl.text,
      batch: batchCtrl.text,
      degree: selectedDegree,
      major: majorCtrl.text,
      phone: phoneCtrl.text,
      registerNo: registerNoCtrl.text,
    );

    if (token.error == null) {
      await PreferenceHelper.saveToken(token.user.id);

      authenticationBloc.add(AuthenticationLoggedInEvent());
      yield RegisterInitialState();
    } else {
      yield RegisterFailureState(error: token.error);
    }
  }

  Stream<RegisterState> _mapEmailExistCheck() async* {
    yield RegisterLoadingState();

    final data = await ResgisterRepository.hasSameEmail(emailCtrl.text);

    if (data)
      yield RegisterFailureState(error: "Email already exists");
    else
      yield EmailDoesNotExistState(email: emailCtrl.text);
  }
}
