import 'package:alumni_app/src/components/input_field.dart';
import 'package:flutter/material.dart';

class RegisterAccount extends StatelessWidget {
  final Function(String, [String]) onInputTextChange;

  const RegisterAccount({Key key, this.onInputTextChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Info",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(height: 50),
          InputField(label: "Name"),
          Container(height: 40),
          InputField(
            name: "email",
            label: "Email",
            onChanged: onInputTextChange,
          ),
          Container(height: 40),
          InputField(label: "Password", obscureText: true)
        ],
      ),
    );
  }
}
