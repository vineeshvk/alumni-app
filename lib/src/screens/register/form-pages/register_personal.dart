import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPersonal extends StatefulWidget {
  final RegisterBloc registerBloc;

  const RegisterPersonal({Key key, this.registerBloc}) : super(key: key);

  @override
  _RegisterPersonalState createState() => _RegisterPersonalState();
}

class _RegisterPersonalState extends State<RegisterPersonal> {
  final _dobCtrl = TextEditingController();
  String _gender;

  void _onDateTimeChanged(DateTime newDate) {
    widget.registerBloc.registerInputs.dob = newDate.toIso8601String();

    _dobCtrl.value = TextEditingValue(
      text: widget.registerBloc.registerInputs.dob.substring(0, 10),
    );
  }

  void _onDobInputTap() {
    showModalBottomSheet(
      context: context,
      builder: (context) => DatePicker(
        onDateTimeChanged: _onDateTimeChanged,
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
          Container(height: 40),
          Text("Gender"),
          Container(
            height: 50,
            width: 300,
            child: CupertinoSlidingSegmentedControl(
              padding: EdgeInsets.all(5),
              groupValue: _gender,
              onValueChanged: (val) {
                widget.registerBloc.registerInputs.gender = val.toString();
                setState(() {
                  _gender = val;
                });
              },
              children: {
                "male": Text("Male"),
                "female": Text("Female"),
                "others": Text("Others")
              },
            ),
          ),
          Container(height: 40),
          InputField(
            label: "Phone number",
            keyboardType: TextInputType.phone,
            onChanged: (text) {
              widget.registerBloc.registerInputs.phone = text;
            },
          )
        ],
      ),
    );
  }
}
