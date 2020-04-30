import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/register/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPersonal extends StatefulWidget {
  @override
  _RegisterPersonalState createState() => _RegisterPersonalState();
}

class _RegisterPersonalState extends State<RegisterPersonal> {
  final _dobCtrl = TextEditingController();
  DateTime date;
  String gender;

  void _onDateTimeChanged(DateTime newDate) {
    _dobCtrl.value = TextEditingValue(
      text: newDate.toIso8601String().substring(0, 10),
    );
    setState(() {
      date = newDate;
    });
  }

  void _onDobInputTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => DatePicker(
        onDateTimeChanged: _onDateTimeChanged,
        initialDateTime: date,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Info",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(height: 50),
          InputField(
            controller: _dobCtrl,
            label: "Date of Birth",
            onTap: _onDobInputTap,
          ),
          Container(
            height: 50,
            width: 300,
            child: CupertinoSegmentedControl(
              groupValue: gender,
              children: {
                "male": Text("Male"),
                "female": Text("Female"),
                "others": Text("Others")
              },
              padding: EdgeInsets.all(5),
              onValueChanged: (val) {
                print("inside segments" + val);
                setState(() {
                  gender = val;
                });
              },
            ),
          ),
          Container(height: 40),
          InputField(label: "Gender"),
          Container(height: 40),
          InputField(label: "Phone number", obscureText: true)
        ],
      ),
    );
  }
}
