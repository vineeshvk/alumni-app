import 'package:alumni_app/src/components/error_message.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/bloc/register_event.dart';
import 'package:alumni_app/src/screens/register/bloc/register_state.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  void _onContinueButtonPressed() {
    _registerBloc.add(CheckEmailExistEvent());
  }

  void _emailCheckListener(BuildContext context, RegisterState state) {
    if (state is EmailDoesNotExistState)
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
            StringResources.accountInfoText,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(height: 50),
          InputField(
            label: StringResources.nameText,
            controller: _registerBloc.nameCtrl,
          ),
          Container(height: 40),
          InputField(
            label: StringResources.emailText,
            keyboardType: TextInputType.emailAddress,
            controller: _registerBloc.emailCtrl,
          ),
          Container(height: 40),
          InputField(
            label: StringResources.passwordText,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: _registerBloc.passwordCtrl,
          ),
          Expanded(child: Container()),
          BlocListener<RegisterBloc, RegisterState>(
            listener: _emailCheckListener,
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return Column(
                  children: <Widget>[
                    if (state is RegisterFailureState)
                      ErrorMessageWidget(message: state.error),
                    PrimaryButton(
                      isLoading: state is RegisterLoadingState,
                      onPressed: _onContinueButtonPressed,
                      text: StringResources.continueText,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
