import 'package:alumni_app/src/components/input_field.dart';
import 'package:flutter/material.dart';

class RegisterCollegeBatch extends StatelessWidget {
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
          InputField(label: "Date of Birth"),
          Container(height: 40),
          InputField(label: "Gender"),
          Container(height: 40),
          InputField(label: "Phone number", obscureText: true)
        ],
      ),
    );
  }
}
