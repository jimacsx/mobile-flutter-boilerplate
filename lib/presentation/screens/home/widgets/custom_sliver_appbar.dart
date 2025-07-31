import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';
import 'package:banking_flutter_app/presentation/providers/theme/theme_provider.dart';

class CustomSliverAppbar extends ConsumerWidget {

  const CustomSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final String name = 'Bankify';
    final isDarkModeAsync = ref.watch(isDarkModeProvider);

    return SliverAppBar(
      floating: true,
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: CircleAvatar(
                backgroundColor: colors.secondaryContainer,
                child: Icon(
                  Icons.account_circle,
                  color: colors.onSecondaryContainer,
                ),
              ), // Ícono personalizado
              onPressed: () {},
            ),
      ),
      titleSpacing: 0,
      title: TranslatedText(
        'hello_bankify',
        values: {'name': name},
      ),
      actions: [
        Builder(
          builder:
              (context) => IconButton(
                icon: isDarkModeAsync.when(
                  data: (isDarkMode) => Icon(
                    isDarkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                  ),
                  loading: () => const Icon(Icons.dark_mode_outlined),
                  error: (_, __) => const Icon(Icons.dark_mode_outlined),
                ),
                onPressed: () => ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
              ),
        ),
        Builder(
          builder:
              (context) => IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: colors.onSurface,
                ),
              ),
        ),
        Builder(
          builder:
              (context) => IconButton(
                onPressed:
                    () => homeViewScaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(Icons.menu_outlined, color: colors.onSurface),
              ),
        ),
      ],
    );
  }
}
