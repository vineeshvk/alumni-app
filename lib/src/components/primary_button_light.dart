import 'package:alumni_app/src/components/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButtonLight extends PrimaryButton {
  PrimaryButtonLight(
      {String text, bool isLoading = false, Function() onPressed})
      : super(text: text, isLoading: isLoading, onPressed: onPressed);

  @override
  Brightness get colorBrightness => Brightness.light;

  @override
  Color get color => Colors.white;
}
