import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String name;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function(BuildContext context) onTap;
  final void Function(String text, String name) onChanged;

  const InputField({
    @required this.label,
    this.name,
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
      onTap: () => onTap(context),
      onChanged: (text) => onChanged(name, text),
      maxLength: null,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: true,
        labelText: label,
      ),
    );
  }
}
