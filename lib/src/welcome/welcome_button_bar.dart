import 'package:alumni_app/src/login/login.dart';
import 'package:alumni_app/src/register/register.dart';
import 'package:flutter/material.dart';

class WelcomeButtonBar extends StatelessWidget {
  void _onSignInPressed(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void _onSignUpPressed(BuildContext context) {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      buttonPadding: EdgeInsets.all(0),
      buttonHeight: 50,
      buttonMinWidth: 133,
      alignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          child: Text("SIGN IN"),
          onPressed: () => _onSignInPressed(context),
        ),
        FlatButton(
          child: Text("SIGN UP"),
          onPressed: () => _onSignUpPressed(context),
        ),
      ],
    );
  }
}
