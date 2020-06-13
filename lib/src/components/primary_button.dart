import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final Brightness colorBrightness;
  final bool isLoading;
  final String text;
  final Color color;

  const PrimaryButton(
      {@required this.onPressed,
      @required this.text,
      this.colorBrightness,
      this.isLoading,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: isLoading ? null : onPressed,
        color: color,
        colorBrightness: colorBrightness,
        child: isLoading ? CupertinoActivityIndicator() : Text(text),
      ),
    );
  }
}
