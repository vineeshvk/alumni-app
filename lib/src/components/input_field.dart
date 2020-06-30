import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function() onTap;
  final void Function(String text) onChanged;
  final int maxLines;
  final int minLines;

  const InputField(
      {@required this.label,
      this.controller,
      this.obscureText = false,
      this.onTap,
      this.onChanged,
      this.keyboardType,
      this.maxLines = 1,
      this.minLines});

  factory InputField.multiLine({
    @required label,
    controller,
    onChanged,
  }) {
    return InputField(
      label: label,
      controller: controller,
      onChanged: onChanged,
      maxLines: null,
      minLines: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onTap: onTap,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        alignLabelWithHint: maxLines == null,
      ),
    );
  }
}
