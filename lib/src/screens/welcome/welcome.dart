import 'package:alumni_app/src/screens/admin-register/admin_register.dart';
import 'package:alumni_app/src/screens/login/login.dart';
import 'package:alumni_app/src/screens/register/register.dart';
import 'package:alumni_app/src/utils/image_resources.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _onSignInPressed() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void _onSignUpPressed() {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  void _onAdminRegisterPressed() {
    Navigator.pushNamed(context, AdminRegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(32),
          physics: BouncingScrollPhysics(),
          children: [
            Container(height: 60),
            Image.asset(
              ImageResources.logoImage,
              width: 20,
              height: 60,
              alignment: Alignment.centerLeft,
            ),
            Container(height: 40),
            ...getWelcomeTexts(),
            Container(
              child: getButtonBar(),
              margin: EdgeInsets.only(top: 150, bottom: 30),
            ),
            // PrimaryButton.accent(
            //   text: StringResources.signUpAsAdminText,
            //   onPressed: _onAdminRegisterPressed,
            // ),
          ],
        ),
      ),
    );
  }

  List<Widget> getWelcomeTexts() {
    return [
      Text(
        StringResources.welcomeText,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      Text(
        StringResources.toAlumniAppText,
        style: TextStyle(fontSize: 26, color: Colors.black45),
      ),
      Text(
        StringResources.connectCollegeText,
        style: TextStyle(fontSize: 26, color: Colors.black45),
      ),
    ];
  }

  Widget getButtonBar() {
    return ButtonBar(
      buttonPadding: EdgeInsets.all(0),
      buttonHeight: 50,
      buttonMinWidth: 133,
      alignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          child: Text(StringResources.signInText.toUpperCase()),
          onPressed: _onSignInPressed,
        ),
        FlatButton(
          textColor: Colors.black,
          child: Text(StringResources.signUpText.toUpperCase()),
          onPressed: _onSignUpPressed,
        ),
      ],
    );
  }
}
