import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(onPressed: () => Navigator.pop(context)),
            ),
            Container(height: 10),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            Text(
              "please sign up to continue",
              style: TextStyle(fontSize: 24, color: Colors.white60),
            ),
            BlocProvider(
              child: RegisterForm(),
              create: (context) {
                return RegisterBloc(
                  userRepository: _authBloc.userRepository,
                  authenticationBloc: _authBloc,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
