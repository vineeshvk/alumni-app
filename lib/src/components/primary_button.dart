import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final Brightness colorBrightness;
  final bool isLoading;
  final String text;
  final Color color;

  const PrimaryButton({
    @required this.onPressed,
    @required this.text,
    this.colorBrightness = Brightness.dark,
    this.isLoading = false,
    this.color,
  });

  factory PrimaryButton.accent({
    @required String text,
    @required Function() onPressed,
    bool isLoading = false,
  }) {
    return PrimaryButton(
      onPressed: onPressed,
      text: text,
      isLoading: isLoading,
      color: SECONDARY_DARK,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        onPressed: isLoading ? null : onPressed,
        color: color,
        colorBrightness: colorBrightness,
        child: isLoading ? CupertinoActivityIndicator() : Text(text),
      ),
    );
  }
}
