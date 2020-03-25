import 'package:alumni_app/src/screens/login.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/logo-dark.png"),
              Container(height: 50),
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
              ButtonBar(
                buttonPadding: EdgeInsets.all(0),
                buttonHeight: 50,
                buttonMinWidth: 133,
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    child: Text("SIGN IN"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                  ),
                  FlatButton(onPressed: () {}, child: Text("SIGN UP")),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.white,
                  colorBrightness: Brightness.light,
                  onPressed: () {},
                  // icon: Icon(Icons.lock),
                  child: Text("SIGN IN AS ADMIN"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
