import 'package:alumni_app/src/components/date_picker.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPersonal extends StatefulWidget {
  @override
  _RegisterPersonalState createState() => _RegisterPersonalState();
}

class _RegisterPersonalState extends State<RegisterPersonal> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  void _onDateTimeChanged(DateTime newDate) {
    _registerBloc.dobCtrl.value = TextEditingValue(
      text: newDate.toIso8601String().substring(0, 10),
    );
  }

  void _onContinueButtonPressed() {
    _registerBloc.pageCtrl.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onDobInputTap() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomDatePicker(
        onDateTimeChanged: _onDateTimeChanged,
      ),
    );
  }

  void _onGenderValueChanged(String val) {
    _registerBloc.genderCtrl.value = TextEditingValue(text: val);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.personalInfoText,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(height: 50),
          InputField(
            controller: _registerBloc.dobCtrl,
            label: StringResources.dateOfBirthText,
            onTap: _onDobInputTap,
          ),
          Container(height: 40),
          Text(StringResources.genderText),
          Container(
            height: 50,
            width: 300,
            child: CupertinoSlidingSegmentedControl(
              padding: EdgeInsets.all(5),
              onValueChanged: _onGenderValueChanged,
              groupValue: _registerBloc.genderCtrl.text != ""
                  ? _registerBloc.genderCtrl.text
                  : null,
              children: Map<String, Widget>.fromIterable(
                GENDER_LIST,
                key: (e) => e,
                value: (e) => Text(e),
              ),
            ),
          ),
          Container(height: 40),
          InputField(
            label: StringResources.phoneNumberText,
            keyboardType: TextInputType.phone,
            controller: _registerBloc.phoneCtrl,
          ),
          Expanded(child: Container()),
          PrimaryButton(
            text: StringResources.continueText,
            onPressed: _onContinueButtonPressed,
          )
        ],
      ),
    );
  }
}
