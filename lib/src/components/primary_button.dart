import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function(BuildContext context) onPressed;
  //TODO: check if context needed

  final String text;

  const PrimaryButton({Key key, @required this.onPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => onPressed(context),
      child: Text(text),
    );
  }
}
