import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/register/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPersonal extends StatefulWidget {
  final void Function(String, String) onInputTextChange;
  final Map<String, String> inputs;

  RegisterPersonal({Key key, this.onInputTextChange, this.inputs});

  @override
  _RegisterPersonalState createState() => _RegisterPersonalState();
}

class _RegisterPersonalState extends State<RegisterPersonal> {
  final _dobCtrl = TextEditingController();

  void _onDateTimeChanged(DateTime newDate) {
    widget.onInputTextChange("dob", newDate.toIso8601String());

    _dobCtrl.value = TextEditingValue(
      text: widget.inputs["dob"].substring(0, 10),
    );
  }

  void _onDobInputTap(BuildContext context) {
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
              onValueChanged: (val) => widget.onInputTextChange("gender", val),
              groupValue: widget.inputs["gender"] == ""
                  ? null
                  : widget.inputs["gender"],
              children: {
                "male": Text("Male"),
                "female": Text("Female"),
                "others": Text("Others")
              },
            ),
          ),
          Container(height: 40),
          InputField(
            name: "phone",
            label: "Phone number",
            keyboardType: TextInputType.phone,
            onChanged: widget.onInputTextChange,
          )
        ],
      ),
    );
  }
}
