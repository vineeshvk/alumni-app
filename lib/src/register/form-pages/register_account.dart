import 'package:alumni_app/src/components/input_field.dart';
import 'package:flutter/material.dart';

class RegisterAccount extends StatelessWidget {
  final void Function(String, String) onInputTextChange;

  const RegisterAccount({this.onInputTextChange});

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
          InputField(
            name: "name",
            label: "Name",
            onChanged: onInputTextChange,
          ),
          Container(height: 40),
          InputField(
            name: "email",
            label: "Email",
            onChanged: onInputTextChange,
            keyboardType: TextInputType.emailAddress,
          ),
          Container(height: 40),
          InputField(
            name: "password",
            label: "Password",
            obscureText: true,
            onChanged: onInputTextChange,
            keyboardType: TextInputType.visiblePassword,
          )
        ],
      ),
    );
  }
}
