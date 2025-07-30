import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/config/constants/routes.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';

class EmailScreen extends StatelessWidget {
  static const String name = 'email_login_screen';

  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      '¡Hola!',
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
                      text: 'Crear una Cuenta',
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

class _EmailForm extends StatelessWidget {
  const _EmailForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // * Email's input
          CustomTextFormField(
            label: 'Correo electrónico',
            hint: 'Ingresa tu correo electrónico',
            keyboardType: TextInputType.emailAddress,
            errorMessage: null,
          ),
          const SizedBox(height: 24),
          // * Form's button
          CustomFilledButton(
            text: 'Continuar',
            onPressed: () {
              context.push(publicRoutes['loginPassword']!);
            },
          ),
        ],
      ),
    );
  }
}
