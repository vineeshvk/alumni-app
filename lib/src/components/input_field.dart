import 'package:alumni_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String name;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final void Function(BuildContext context) onTap;
  final void Function(String text, [String name]) onChanged;

  const InputField({
    @required this.label,
    this.name,
    this.controller,
    this.obscureText = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onTap: () => onTap(context),
      onChanged: (text) => onChanged(text, name),
      maxLength: null,
      decoration: InputDecoration(
        enabled: true,
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SECONDARY_TEXT, width: 3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
      ),
    );
  }
}
