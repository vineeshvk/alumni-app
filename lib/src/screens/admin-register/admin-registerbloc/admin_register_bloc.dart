import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_event.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminRegisterBloc extends Bloc<AdminRegisterEvent, AdminRegisterState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AdminRegisterBloc() : super(AdminRegisterInitialState());

  @override
  Stream<AdminRegisterState> mapEventToState(AdminRegisterEvent event) async* {
    if (event is AdminRegisterRequestEvent) {
      yield AdminRegisterLoadingState();

      yield AdminRegisterFailureState(error: "Some inputs missing");
    }
  }
}
