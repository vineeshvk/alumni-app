import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function(BuildContext context) onPressed;

  const NextButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => onPressed(context),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      child: Icon(
        Icons.arrow_forward,
        size: 35,
      ),
    );
  }
}
