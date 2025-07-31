import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';
import 'package:banking_flutter_app/features/auth/auth.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class RecoverPasswordScreen extends ConsumerWidget {
  static const String name = 'recover_password_screen';

  const RecoverPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: TranslatedText('recover_password_screen.title'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // * instructions
                    TranslatedText(
                      'recover_password_screen.instructions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // * Recover password's form
                    const _RecoverPasswordForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RecoverPasswordForm extends ConsumerWidget {
  const _RecoverPasswordForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recoverPasswordForm = ref.watch(recoverPasswordFormProvider);

    return Form(
      child: Column(
        children: [
          // * Email's input
          CustomTextFormField(
            label: ref.watch(
              translationProvider('recover_password_screen.email_label'),
            ),
            hint: ref.watch(
              translationProvider('recover_password_screen.email_hint'),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged:
                ref.read(recoverPasswordFormProvider.notifier).onEmailChanged,
            errorMessage: // Only displays an error if submit is clicked and there is an error
                recoverPasswordForm.isFormPosted
                    ? recoverPasswordForm.email.errorMessage
                    : null,
          ),
          const SizedBox(height: 24),
          // * Form's button
          CustomFilledButton(
            text: ref.watch(
              translationProvider('recover_password_screen.recover_button'),
            ),
            onPressed: () {
              ref.read(recoverPasswordFormProvider.notifier).onFormSubmit();
              if (recoverPasswordForm.isValid) {
                context.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
