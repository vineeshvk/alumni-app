import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/next_button.dart';
import 'package:alumni_app/src/home/home.dart';
import 'package:alumni_app/src/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/register/bloc/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  final nameCtrl = new TextEditingController();
  final emailCtrl = new TextEditingController();
  final passCtrl = new TextEditingController();

  void _registerOnPress(context) {
    BlocProvider.of<RegisterBloc>(context).add(
      RegisterButtonPressed(
        name:nameCtrl.text,
        email: emailCtrl.text,
        password: passCtrl.text,
      ),
    );
  }

  void _onSuccessNavigation(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationAuthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (val) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: _onSuccessNavigation,
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(height: 60),
            InputField(label: "Name", controller: nameCtrl),
            Container(height: 40),
            InputField(label: "Email", controller: emailCtrl),
            Container(height: 40),
            InputField(
              label: "Password",
              controller: passCtrl,
              obscureText: true,
            ),
            Container(height: 80),
            Align(
              alignment: Alignment.bottomRight,
              child: NextButton(onPressed: _registerOnPress),
            )
          ],
        ),
      ),
    );
  }
}
