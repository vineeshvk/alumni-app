import 'package:alumni_app/src/bloc/authentication-bloc.dart';
import 'package:alumni_app/src/bloc/login-bloc.dart';
import 'package:alumni_app/src/components/input-field.dart';
import 'package:alumni_app/src/events/login-event.dart';
import 'package:alumni_app/src/repositories/user-repository.dart';
import 'package:alumni_app/src/states/login-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final UserRepository userRepository;

  const LoginScreen({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: Container(
            padding: EdgeInsets.all(32),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(onPressed: () => Navigator.pop(context)),
                ),
                Container(height: 10),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(height: 10),
                Text(
                  "please sign in to continue",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white60,
                  ),
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final emailCtrl = new TextEditingController();
  final passCtrl = new TextEditingController();

  void _loginOnPress(context) {
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: emailCtrl.text,
        password: passCtrl.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
        child: Column(
          children: <Widget>[
            Container(height: 60),
            InputField(label: "Email", controller: emailCtrl),
            Container(height: 40),
            InputField(label: "Password", controller: passCtrl),
            Container(height: 100),
            Align(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                onPressed: () => _loginOnPress(context),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
