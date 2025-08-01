import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class ProfileScreen extends ConsumerWidget {
  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    // Get information from the validated user
    final String name = 'Hector';
    final String fullName = 'Héctor Zaragoza Cortés';
    final String lastLoginAt = 'Sep 25, 2025';
    final String lastLoginTime = '12:03h';
    final String timezone = 'CST';

    return Scaffold(
      appBar: AppBar(
        title: const TranslatedText('profile_screen.title'),
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
                TranslatedText(
                  'profile_screen.last_session',
                  values: {
                    'date': lastLoginAt,
                    'time': lastLoginTime,
                    'timezone': timezone,
                  },
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                // * Logout's button
                CustomFilledIconButton(
                  text: ref.watch(translationProvider('logout')),
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
