import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterAccount extends StatelessWidget {
  final RegisterBloc registerBloc;

  const RegisterAccount({Key key, this.registerBloc}) : super(key: key);

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
            label: "Name",
            onChanged: (text) {
              registerBloc.registerInputs.name = text;
            },
          ),
          Container(height: 40),
          InputField(
            label: "Email",
            onChanged: (text) {
              registerBloc.registerInputs.email = text;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          Container(height: 40),
          InputField(
            label: "Password",
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) {
              registerBloc.registerInputs.password = text;
            },
          )
        ],
      ),
    );
  }
}
