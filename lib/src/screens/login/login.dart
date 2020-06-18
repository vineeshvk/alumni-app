import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/next_button.dart';
import 'package:alumni_app/src/screens/login/bloc/login_bloc.dart';
import 'package:alumni_app/src/screens/login/bloc/login_event.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  void _loginOnPress(context) {
    _loginBloc.add(LoginButtonPressedEvent());
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
              StringResources.welcomeText,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            Text(
              "please sign in to continue",
              style: TextStyle(fontSize: 24, color: Colors.white60),
            ),
            getTextFormWidget(),
          ],
        ),
      ),
    );
  }

  Widget getTextFormWidget() {
    return Column(
      children: <Widget>[
        Container(height: 60),
        InputField(label: "Email", controller: _loginBloc.emailController),
        Container(height: 40),
        InputField(
          label: "Password",
          controller: _loginBloc.passwordController,
        ),
        Container(height: 100),
        Align(
          alignment: Alignment.bottomRight,
          child: NextButton(onPressed: _loginOnPress),
        )
      ],
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    _loginBloc.emailController.dispose();
    _loginBloc.passwordController.dispose();
    super.dispose();
  }
}
