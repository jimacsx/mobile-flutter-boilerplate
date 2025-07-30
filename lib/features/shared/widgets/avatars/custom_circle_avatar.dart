import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {

  // Text to be displayed on the avatar
  final String text;

  const CustomCircleAvatar({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: 30,
      backgroundColor: colors.primaryContainer,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colors.onPrimaryContainer,
        ),
      ),
    );
  }
}