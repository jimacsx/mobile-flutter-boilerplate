import 'package:banking_flutter_app/presentation/shared_widgets/custom_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget{
  final Function(String?)? onSaved;
  const PasswordField({super.key, this.onSaved});
  
  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomField(
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        helperText: '',
        hintText: "Enter password",
        suffixIcon: IconButton(
          onPressed: () => setState(() => obscurePassword = !obscurePassword), 
          icon: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off
          )
        )
      ),
      validator: (s) {
        if (s!.isEmpty) return "This field is required";
        if (s.length < 8) return "Password lenght must be at least 8 characters";
        return null;
      },
      onSaved: widget.onSaved,
    );
  }
}