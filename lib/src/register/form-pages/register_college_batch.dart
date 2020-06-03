import 'package:alumni_app/src/components/input_field.dart';
import 'package:flutter/material.dart';

class RegisterCollegeBatch extends StatelessWidget {
  final void Function(String, String) onInputTextChange;

  const RegisterCollegeBatch({this.onInputTextChange});
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
            onChanged: (val) => onInputTextChange("degree", val),
            items: ["B.A", "B.Sc", "B.E"]
                .map((e) => DropdownMenuItem(child: Text(e), value: e))
                .toList(),
          ),
          Container(height: 40),
          InputField(
            name: "major",
            label: "Major",
            onChanged: onInputTextChange,
          ),
          Container(height: 40),
          InputField(
            name: "batch",
            label: "Batch",
            onChanged: onInputTextChange,
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }
}
