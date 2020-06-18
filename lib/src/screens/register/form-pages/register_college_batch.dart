import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterCollegeBatch extends StatelessWidget {
  final RegisterBloc registerBloc;

  const RegisterCollegeBatch({Key key, this.registerBloc}) : super(key: key);

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
          DropdownButtonFormField<String>(
            hint: Text("Degree"),
            onChanged: (val) {
              registerBloc.registerInputs.degree = val;
            },
            items: ["B.A", "B.Sc", "B.E"]
                .map((e) => DropdownMenuItem(child: Text(e), value: e))
                .toList(),
          ),
          Container(height: 40),
          InputField(
            label: "Major",
            onChanged: (text) {
              registerBloc.registerInputs.major = text;
            },
          ),
          Container(height: 40),
          InputField(
            label: "Batch",
            keyboardType: TextInputType.number,
            onChanged: (text) {
              registerBloc.registerInputs.batch = text;
            },
          )
        ],
      ),
    );
  }
}
