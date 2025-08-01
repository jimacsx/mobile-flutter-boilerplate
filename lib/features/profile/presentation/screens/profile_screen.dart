import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Get information from the validated user
    final String name = 'Hector';
    final String fullName = 'Héctor Zaragoza Cortés';
    final String lastLoginAt = 'Última sesión: Sep 25, 2025 — 12:03h (CST)';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 16),
                // * Avatar
                CustomCircleAvatar(text: name[0].toUpperCase()),
                const SizedBox(height: 16),
                // * Full name
                Text(
                  fullName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: colors.onSurface,
                  ),
                ),
                // * Last login at
                Text(
                  lastLoginAt,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                // * Logout's button
                CustomFilledIconButton(
                  text: 'Cerrar Sesión',
                  icon: Icons.logout,
                  onPressed: () {
                    context.go(publicRoutes['loginEmail']!);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
