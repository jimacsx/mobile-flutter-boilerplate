import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class TranslatedText extends ConsumerWidget {
  final String translationKey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fallbackText;

  const TranslatedText(
    this.translationKey, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fallbackText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translation = ref.watch(translationProvider(translationKey));
    
    return Text(
      translation,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class TranslatedTextButton extends ConsumerWidget {
  final String translationKey;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget? child;
  final String? fallbackText;

  const TranslatedTextButton(
    this.translationKey, {
    super.key,
    this.onPressed,
    this.style,
    this.child,
    this.fallbackText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translation = ref.watch(translationProvider(translationKey));
    
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: child ?? Text(translation),
    );
  }
}

class TranslatedElevatedButton extends ConsumerWidget {
  final String translationKey;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget? child;
  final String? fallbackText;

  const TranslatedElevatedButton(
    this.translationKey, {
    super.key,
    this.onPressed,
    this.style,
    this.child,
    this.fallbackText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translation = ref.watch(translationProvider(translationKey));
    
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child ?? Text(translation),
    );
  }
} 