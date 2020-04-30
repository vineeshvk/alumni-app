import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButtonLight extends StatelessWidget {
  final Function(BuildContext context) onPressed;
  final String text;

  const PrimaryButtonLight({Key key, @required this.onPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      colorBrightness: Brightness.light,
      onPressed: () => onPressed(context),
      child: Text(text),
    );
  }
}
