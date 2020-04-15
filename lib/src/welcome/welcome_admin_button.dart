import 'package:flutter/material.dart';

class WelcomeAdminButton extends StatelessWidget {
  const WelcomeAdminButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      colorBrightness: Brightness.light,
      onPressed: () {},
      child: Text("SIGN IN AS ADMIN"),
    );
  }
}
