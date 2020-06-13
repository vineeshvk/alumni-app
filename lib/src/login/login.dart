import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/login/bloc/login_bloc.dart';
import 'package:alumni_app/src/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              "please sign in to continue",
              style: TextStyle(fontSize: 24, color: Colors.white60),
            ),
            BlocProvider(
              child: LoginForm(),
              create: (context) {
                return LoginBloc(
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

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }
}
