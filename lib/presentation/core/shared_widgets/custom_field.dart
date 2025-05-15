import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;

  const CustomField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
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