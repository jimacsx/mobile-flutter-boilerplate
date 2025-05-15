import 'package:banking_flutter_app/presentation/core/shared_widgets/custom_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget{
  final Function(String?)? onSaved;
  const EmailField({super.key, this.onSaved});
  
  @override
  State<StatefulWidget> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );


  @override
  Widget build(BuildContext context) {
    return CustomField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        helperText: '',
        hintText: "email@email.com",
      ),
      validator: (s) {
        if (s!.isEmpty) return "This field is required";
        if (emailRegExp.hasMatch(s)) return "Enter a valid format";
        return null;
      },
      onSaved: widget.onSaved,
    );
  }
}