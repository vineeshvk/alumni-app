import 'package:alumni_app/src/components/primary_button_light.dart';
import 'package:alumni_app/src/welcome/welcome_button_bar.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(32),
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(
              "assets/images/logo-dark.png",
              width: 120,
              height: 160,
              alignment: Alignment.centerLeft,
            ),
            Text(
              "Welcome,",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              "to the alumni app",
              style: TextStyle(fontSize: 26, color: Colors.white60),
            ),
            Container(height: 50),
            Text(
              "Where you can connect with your college",
              style: TextStyle(fontSize: 26, color: Colors.white60),
            ),
            Container(height: 110),
            WelcomeButtonBar(),
            Container(height: 32),
            PrimaryButtonLight(onPressed: null, text: "SIGN IN AS ADMIN"),
          ],
        ),
      ),
    );
  }
}
