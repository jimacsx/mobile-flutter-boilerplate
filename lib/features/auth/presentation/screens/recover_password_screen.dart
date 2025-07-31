import 'package:banking_flutter_app/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecoverPasswordScreen extends StatelessWidget {
  static const String name = 'recover_password_screen';

  const RecoverPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recupera tu contraseña'),
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
                    Text(
                      'Ingresa la dirección de correo electrónico asociada a tu cuenta y te enviaremos instrucciones para restablecer tu contraseña.',
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

class _RecoverPasswordForm extends StatelessWidget {
  const _RecoverPasswordForm();

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
          ),
          const SizedBox(height: 24),
          // * Form's button
          CustomFilledButton(text: 'Recuperar Contraseña', onPressed: () {}),
        ],
      ),
    );
  }
}
