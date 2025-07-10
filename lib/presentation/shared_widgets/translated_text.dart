import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class TranslatedText extends ConsumerWidget {
  final String translationKey;
  final Map<String, dynamic>? values;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fallbackText;

  const TranslatedText(
    this.translationKey, {
    super.key,
    this.values,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fallbackText,
  });

  String _interpolateString(String template, Map<String, dynamic> values) {
    String result = template;
    
    values.forEach((key, value) {
      final placeholder = '{$key}';
      if (result.contains(placeholder)) {
        result = result.replaceAll(placeholder, value.toString());
      }
    });
    
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translation = ref.watch(translationProvider(translationKey));
    
    final finalText = values != null 
        ? _interpolateString(translation, values!)
        : translation;
    
    return Text(
      finalText,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class TranslatedTextButton extends ConsumerWidget {
  final String translationKey;
  final Map<String, dynamic>? values;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget? child;
  final String? fallbackText;

  const TranslatedTextButton(
    this.translationKey, {
    super.key,
    this.values,
    this.onPressed,
    this.style,
    this.child,
    this.fallbackText,
  });

  String _interpolateString(String template, Map<String, dynamic> values) {
    String result = template;
    
    values.forEach((key, value) {
      final placeholder = '{$key}';
      if (result.contains(placeholder)) {
        result = result.replaceAll(placeholder, value.toString());
      }
    });
    
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translation = ref.watch(translationProvider(translationKey));
    
    final finalText = values != null 
        ? _interpolateString(translation, values!)
        : translation;
    
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: child ?? Text(finalText),
    );
  }
}

class TranslatedElevatedButton extends ConsumerWidget {
  final String translationKey;
  final Map<String, dynamic>? values;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget? child;
  final String? fallbackText;

  const TranslatedElevatedButton(
    this.translationKey, {
    super.key,
    this.values,
    this.onPressed,
    this.style,
    this.child,
    this.fallbackText,
  });

  String _interpolateString(String template, Map<String, dynamic> values) {
    String result = template;
    
    values.forEach((key, value) {
      final placeholder = '{$key}';
      if (result.contains(placeholder)) {
        result = result.replaceAll(placeholder, value.toString());
      }
    });
    
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translation = ref.watch(translationProvider(translationKey));
    
    final finalText = values != null 
        ? _interpolateString(translation, values!)
        : translation;
    
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child ?? Text(finalText),
    );
  }
} 