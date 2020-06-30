import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onPressed;
  final double left;

  const CustomBackButton({
    Key key,
    this.onPressed,
    this.left = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: left, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: BackButton(onPressed: onPressed ?? () => Navigator.pop(context)),
      ),
    );
  }
}
