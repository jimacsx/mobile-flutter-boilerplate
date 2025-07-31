import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  late FocusNode _myFocusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _myFocusNode = FocusNode();

    _myFocusNode.addListener(() {
      setState(() {
        _isFocused = _myFocusNode.hasFocus;
        // print('TextFormField has focus: $_isFocused');
      });
    });
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(4));

    return TextFormField(
      focusNode: _myFocusNode,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration( // changes the physical appearance of the input
        // the border when the input is enabled and no error is displayed
        enabledBorder: border.copyWith(
          borderSide: BorderSide(color: colors.outline),
        ),
        // the border when the input has the focus and does not show error
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 3),
        ),
        // the border when the input has errorText and is not in focus
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        // the border when the input has errorText and has focus
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        // so that the input is not so large
        isDense: true,
        // label text
        label: widget.label != null ? Text(widget.label!) : null,
        // "always" put the label at the top
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // label's styles
        floatingLabelStyle: TextStyle(
          color: (widget.errorMessage != null && widget.errorMessage!.isNotEmpty) 
            ? colors.error
            : _isFocused 
              ? colors.primary
              : colors.onSurfaceVariant,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
        ),
        // hintText is like the placeholder
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: colors.onSurfaceVariant,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        // error text
        errorText: widget.errorMessage,
        // error text's styles
        errorStyle: TextStyle(
          color: colors.error,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
        ),
        // prompt color when input is in focus
        focusColor: colors.primary,
        // icon positioned to the left inside the input
        // prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        // icon positioned to the right inside the input
        suffixIcon:
            (widget.errorMessage != null && widget.errorMessage!.isNotEmpty)
                ? Icon(
                  Icons.error_rounded,
                  color: colors.error,
                )
                : null,
        // icon positioned to the left, outside the input
        // icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary)
      ),
      // Turn off autocomplete suggestions
      // autofillHints: const <String>[],
      // Turn off text auto-correction while you type
      autocorrect: false,
      // Turn off word suggestions that appear above the keyboard
      enableSuggestions: false,
      // Turn off spell check
      // spellCheckConfiguration: SpellCheckConfiguration.disabled(),
    );
  }
}
