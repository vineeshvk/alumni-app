import 'package:alumni_app/src/components/error_message.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/bloc/register_event.dart';
import 'package:alumni_app/src/screens/register/bloc/register_state.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCollegeBatch extends StatefulWidget {
  @override
  _RegisterCollegeBatchState createState() => _RegisterCollegeBatchState();
}

class _RegisterCollegeBatchState extends State<RegisterCollegeBatch> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  void _onRegisterButtonPressed() {
    _registerBloc.add(RegisterButtonPressedEvent());
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
          DropdownButtonFormField<String>(
            hint: Text(StringResources.degreeText),
            onChanged: (val) {
              _registerBloc.degreeCtrl.value = TextEditingValue(text: val);
            },
            items: DEGREE_LIST
                .map((e) => DropdownMenuItem(child: Text(e), value: e))
                .toList(),
          ),
          Container(height: 40),
          InputField(
            label: StringResources.majorText,
            controller: _registerBloc.majorCtrl,
          ),
          Container(height: 40),
          InputField(
            label: StringResources.batchText,
            keyboardType: TextInputType.number,
            controller: _registerBloc.batchCtrl,
          ),
          Expanded(child: Container()),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state is RegisterFailureState)
                    ErrorMessageWidget(message: state.error),
                  PrimaryButton.accent(
                    isLoading: state is RegisterLoadingState,
                    onPressed: _onRegisterButtonPressed,
                    text: StringResources.registerText,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
