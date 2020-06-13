import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/constants/colors.dart';
import 'package:alumni_app/src/main/main.dart';
import 'package:alumni_app/src/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';

  void _authenticationRoutes(BuildContext context, AuthenticationState state) {
    String route;

    if (state is AuthenticationAuthenticated) route = MainScreen.routeName;
    if (state is AuthenticationUnauthenticated) route = WelcomeScreen.routeName;

    if (route != null) Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_DARK,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _authenticationRoutes,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/logo-dark.png"),
              Text(
                "Alumni app",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
