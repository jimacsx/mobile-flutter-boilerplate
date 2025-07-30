import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  // Text to be displayed on the button
  final String text;
  // Function that will be executed when the button is pressed
  final VoidCallback? onPressed;
  // Indicates whether the button is enabled or disabled
  final bool isEnabled;
  // Indicates whether a load indicator is to be displayed
  final bool isLoading;
  // Horizontal button padding
  final double horizontalPadding;
  // Vertical button padding
  final double verticalPadding;
  // Button border radius
  final double borderRadius;
  // Text font size
  final double fontSize;
  // Text font weight
  final FontWeight fontWeight;
  // The width of the button
  final double? width;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.horizontalPadding = 32.0,
    this.verticalPadding = 16.0,
    this.borderRadius = 16,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      child: FilledButton(
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        style: FilledButton.styleFrom(
          elevation: 0, // No shadow for a flat design
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius),
          ),
        ),
        child:
            isLoading
                ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(colors.onSurface),
                  ),
                )
                : Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: isEnabled ? colors.onPrimary : colors.onSurface,
                  ),
                ),
      ),
    );
  }
}
