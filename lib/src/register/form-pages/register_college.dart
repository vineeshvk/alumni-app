import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterCollege extends StatelessWidget {
  final RegisterBloc registerBloc;

  const RegisterCollege({Key key, this.registerBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "College Info",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(height: 50),
          InputField(
            label: "College name",
            onChanged: (text) {
              registerBloc.registerInputs.collegeId = text;
            },
          ),
          Container(height: 40),
          InputField(
            label: "Register number",
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) {
              registerBloc.registerInputs.registerNo = text;
            },
          ),
        ],
      ),
    );
  }
}
