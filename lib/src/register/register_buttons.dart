import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/components/primary_button_light.dart';
import 'package:flutter/material.dart';

class RegisterButtons extends StatelessWidget {
  final bool registerComplete;
  final void Function(BuildContext) onRegisterButtonPressed;
  final void Function(BuildContext) onContinueButtonPressed;

  const RegisterButtons(
      {Key key,
      this.registerComplete,
      this.onRegisterButtonPressed,
      this.onContinueButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return registerComplete
        ? PrimaryButtonLight(
            text: "REGISTER",
            onPressed: onRegisterButtonPressed,
          )
        : PrimaryButton(
            text: "CONTINUE",
            onPressed: onContinueButtonPressed,
          );
  }
}
