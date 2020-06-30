import 'package:alumni_app/src/components/primary_button.dart';
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
  void onSignInPressed(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void onSignUpPressed(BuildContext context) {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(32),
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(
              ImageResources.logoDarkImage,
              width: 120,
              height: 160,
              alignment: Alignment.centerLeft,
            ),
            ...getWelcomeTexts(),
            Container(
              child: getButtonBar(),
              margin: EdgeInsets.only(top: 150, bottom: 30),
            ),
            PrimaryButton.accent(
              text: StringResources.signInAsAdminText,
              onPressed: () {},
            ),
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
          child: Text(StringResources.signInButtonText),
          onPressed: () => onSignInPressed(context),
        ),
        FlatButton(
          textColor: Colors.black,
          child: Text(StringResources.signUpText),
          onPressed: () => onSignUpPressed(context),
        ),
      ],
    );
  }
}
