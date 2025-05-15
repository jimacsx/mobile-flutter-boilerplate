import 'package:flutter/material.dart';

class InputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: color,
        width: 1.0
      )
    );
  }

  InputDecorationTheme theme () => InputDecorationTheme(
    contentPadding: EdgeInsets.all(16),
    // "always" put the label at the top
    floatingLabelBehavior: FloatingLabelBehavior.always,
    // Defines minimum and maximum sizes for the [InputDecorator]
    // constraints: BoxConstraints(maxWidth: 150),

    // Borders
    enabledBorder: _buildBorder(Colors.grey[600]!),
    errorBorder: _buildBorder(Colors.red),
    focusedErrorBorder: _buildBorder(Colors.red),
    focusedBorder: _buildBorder(Colors.grey),
    disabledBorder: _buildBorder(Colors.grey[400]!),

    // TextStyles
    suffixStyle: _buildTextStyle(Colors.black),
    counterStyle: _buildTextStyle(Colors.grey, size: 12.0),
    floatingLabelStyle: _buildTextStyle(Colors.black),
    // error and helper style should have the same size
    errorStyle: _buildTextStyle(Colors.red, size: 12.0),
    helperStyle: _buildTextStyle(Colors.grey, size: 12.0), 
    hintStyle: _buildTextStyle(Colors.grey), 
    labelStyle: _buildTextStyle(Colors.black), 
    prefixStyle: _buildTextStyle(Colors.black), 
    
  );
}