import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/next_button.dart';
import 'package:alumni_app/src/login/bloc/login_bloc.dart';
import 'package:alumni_app/src/login/bloc/login_event.dart';
import 'package:alumni_app/src/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final emailCtrl = new TextEditingController();
  final passCtrl = new TextEditingController();

  void _loginOnPress(context) {
    print("button on pressed");
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: emailCtrl.text,
        password: passCtrl.text,
      ),
    );
  }

  void _onSuccessNavigation(BuildContext context, AuthenticationState state) {
    print(" from state $state");
    if (state is AuthenticationAuthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainScreen.routeName,
        (val) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: _onSuccessNavigation,
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      child: Column(
        children: <Widget>[
          Container(height: 60),
          InputField(label: "Email", controller: emailCtrl),
          Container(height: 40),
          InputField(label: "Password", controller: passCtrl),
          Container(height: 100),
          Align(
            alignment: Alignment.bottomRight,
            child: NextButton(onPressed: _loginOnPress),
          )
        ],
      ),
    );
  }
}
