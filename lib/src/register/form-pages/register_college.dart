import 'package:alumni_app/src/components/input_field.dart';
import 'package:flutter/material.dart';

class RegisterCollege extends StatelessWidget {
  final void Function(String, String) onInputTextChange;

  const RegisterCollege({this.onInputTextChange});

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
            name: "collegeId",
            label: "College name",
            onChanged: onInputTextChange,
          ),
          Container(height: 40),
          InputField(
            name: "registerNo",
            label: "Register number",
            keyboardType: TextInputType.visiblePassword,
            onChanged: onInputTextChange,
          ),
        ],
      ),
    );
  }
}
