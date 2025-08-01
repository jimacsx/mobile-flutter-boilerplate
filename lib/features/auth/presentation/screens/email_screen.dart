import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';
import 'package:banking_flutter_app/features/auth/auth.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class EmailScreen extends ConsumerWidget {
  static const String name = 'email_login_screen';

  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image.asset('assets/images/bankify-logo.png', height: 48),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            // **IMPORTANT:** In order for the Column to center vertically,
            // its parent (here, the widget inside SingleChildScrollView)
            // It must be high enough to allow it to expand up to
            // the available space
            child: SizedBox(
              // Use ConstrainedBox or SizedBox to ensure that the height
              // of the SingleChildScrollView content is at least the available height.
              // In this case, MediaQuery.of(context).size.height - kToolbarHeight
              // calculates the remaining height of the screen after the AppBar.
              // Also consider the bottom of the SafeArea if your AppBar does not cover the entire top.
              height:
                  MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  // Center the children along the main (vertical) axis.
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center the children along the transverse (horizontal) axis.
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // * Greetings
                    TranslatedText(
                      'email_screen.greeting',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // * Email's form
                    const _EmailForm(),
                    // * Divider
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Divider(),
                    ),
                    // * Register's button
                    CustomOutlinedButton(
                      text: ref.watch(
                        translationProvider(
                          'email_screen.create_account_button',
                        ),
                      ),
                      onPressed: () {},
                    ),
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

class _EmailForm extends ConsumerWidget {
  const _EmailForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final loginEmailForm = ref.watch(loginEmailFormProvider);
    final emailValidationState = ref.watch(emailValidationProvider);

    return Form(
      child: Column(
        children: [
          // * Email's input
          CustomTextFormField(
            label: ref.watch(translationProvider('email_screen.email_label')),
            hint: ref.watch(translationProvider('email_screen.email_hint')),
            keyboardType: TextInputType.emailAddress,
            onChanged: ref.read(loginEmailFormProvider.notifier).onEmailChanged,
            errorMessage: // Only displays an error if submit is clicked and there is an error
                loginEmailForm.isFormPosted
                    ? loginEmailForm.email.errorMessage
                    : null,
          ),
          const SizedBox(height: 24),
          // * Form's button
          CustomFilledButton(
            isLoading: emailValidationState.isLoading,
            text: emailValidationState.isLoading 
              ? 'Validando...' 
              : ref.watch(translationProvider('email_screen.continue_button')),
            onPressed: emailValidationState.isLoading 
              ? null 
              : () async {
                  ref.read(loginEmailFormProvider.notifier).onFormSubmit();
                  if (loginEmailForm.isValid) {
                    // Validar email con el servicio
                    await ref.read(emailValidationProvider.notifier).validateEmail(
                      loginEmailForm.email.value,
                    );
                    
                    // Verificar el resultado de la validación
                    final currentState = ref.read(emailValidationProvider);
                    if (currentState.validatedUser != null) {
                      // Email válido, continuar a la pantalla de contraseña
                      if (context.mounted) {
                        context.push(publicRoutes['loginPassword']!);
                      }
                    } else if (currentState.errorMessage != null) {
                      // Mostrar error en snackbar
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(currentState.errorMessage!),
                            backgroundColor: colors.error,
                            duration: Duration(seconds: 8), // default to 4s
                          ),
                        );
                      }
                    }
                  }
                },
          ),
        ],
      ),
    );
  }
}
