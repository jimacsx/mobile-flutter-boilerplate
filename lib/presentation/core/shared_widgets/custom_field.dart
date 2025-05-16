import 'package:flutter/material.dart';

// TODO: Update this widget once we receive the Figma, to centralize the input logic in it.
class CustomField extends StatelessWidget {

  final bool obscureText;
  final Function(String)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;

  const CustomField({
    super.key, 
    this.obscureText = false,
    this.onSaved, 
    this.validator, 
    this.keyboardType,
    this.decoration
  });

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

    return TextFormField(
      onChanged: onSaved,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: decoration,
    );
  }
}