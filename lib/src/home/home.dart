import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  void _onLogoutNavigation(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationUnauthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        WelcomeScreen.routeName,
        (val) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final _bloc = BlocProvider.of<AuthenticationBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BlocListener(
              bloc: _bloc,
              listener: _onLogoutNavigation,
              child: RaisedButton(
                child: Text("Log out"),
                onPressed: () {
                  _bloc.add(LoggedOut());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
