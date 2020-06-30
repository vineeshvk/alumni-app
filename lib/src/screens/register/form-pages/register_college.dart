import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCollege extends StatefulWidget {
  @override
  _RegisterCollegeState createState() => _RegisterCollegeState();
}

class _RegisterCollegeState extends State<RegisterCollege> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  void _onContinueButtonPressed() {
    _registerBloc.pageCtrl.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.collegeInfoText,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(height: 50),
          InputField(
            label: StringResources.collegeNameText,
            controller: _registerBloc.collegeCtrl,
          ),
          Container(height: 40),
          InputField(
            label: StringResources.registerNumberText,
            keyboardType: TextInputType.visiblePassword,
            controller: _registerBloc.registerNoCtrl,
          ),
          Expanded(child: Container()),
          PrimaryButton(
            onPressed: _onContinueButtonPressed,
            text: StringResources.continueText,
          )
        ],
      ),
    );
  }
}
