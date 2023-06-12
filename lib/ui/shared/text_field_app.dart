import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enableInteractiveSelection;
  final Color fillColor;
  final String? hintText;
  final bool readOnly;
  final FormFieldValidator? validator;

  const TextFieldApp({
    Key? key,
    this.controller,
    this.enableInteractiveSelection,
    this.fillColor = Colors.white,
    this.hintText,
    this.readOnly = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        border: const OutlineInputBorder(),
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
      ),
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      readOnly: readOnly,
      validator: validator,
    );
  }
}
