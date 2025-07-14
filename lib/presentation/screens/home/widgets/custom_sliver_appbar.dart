import 'package:flutter/material.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class CustomSliverAppbar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback toggleDarkMode;
  final bool isDarkMode;

  const CustomSliverAppbar({
    super.key,
    required this.scaffoldKey,
    required this.isDarkMode,
    required this.toggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final String name = 'Bankify';

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
                icon: Icon(
                  isDarkMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                onPressed: () => toggleDarkMode(),
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
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(Icons.menu_outlined, color: colors.onSurface),
              ),
        ),
      ],
    );
  }
}
