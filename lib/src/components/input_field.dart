import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function() onTap;
  final void Function(String text) onChanged;

  const InputField({
    @required this.label,
    this.controller,
    this.obscureText = false,
    this.onTap,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onTap: onTap,
      onChanged: onChanged,
      maxLength: null,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: true,
        labelText: label,
      ),
    );
  }
}
