import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/components/primary_button_light.dart';
import 'package:flutter/material.dart';

class RegisterButtons extends StatelessWidget {
  final bool registerComplete;
  final void Function() onRegisterButtonPressed;
  final void Function() onContinueButtonPressed;
  final bool isLoading;

  RegisterButtons({
    this.registerComplete = false,
    this.onRegisterButtonPressed,
    this.onContinueButtonPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return registerComplete
        ? PrimaryButtonLight(
            text: "REGISTER",
            isLoading: isLoading,
            onPressed: onRegisterButtonPressed,
          )
        : PrimaryButton(
            text: "CONTINUE",
            isLoading: isLoading,
            onPressed: onContinueButtonPressed,
          );
  }
}
