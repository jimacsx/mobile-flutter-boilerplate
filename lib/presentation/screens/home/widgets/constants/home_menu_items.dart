import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' show IconData;
import 'package:banking_flutter_app/config/constants/routes.dart';

class MenuItem {
  final String link;
  final IconData icon;
  // New fields for localization
  final String titleKey;
  final String subtitleKey;

  // constructor
  const MenuItem({
    required this.link,
    required this.icon,
    required this.titleKey,
    required this.subtitleKey,
  });
}

final homeMenuItems = <MenuItem>[
  MenuItem(
    link: privateRoutes['settings']!,
    icon: Icons.settings,
    titleKey: 'settings',
    subtitleKey: 'settings_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['translation-demo']!,
    icon: Icons.translate,
    titleKey: 'translation_demo',
    subtitleKey: 'translation_demo_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['bottom-bar']!,
    icon: Icons.border_bottom,
    titleKey: 'bottom_navigation_bar',
    subtitleKey: 'bottom_navigation_bar_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['drawer']!,
    icon: Icons.menu,
    titleKey: 'drawer',
    subtitleKey: 'drawer_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['counter-riverpod']!,
    icon: Icons.add,
    titleKey: 'riverpod_counter',
    subtitleKey: 'riverpod_counter_subtitle',
  ),
  MenuItem(
    link: publicRoutes['login']!,
    icon: Icons.login,
    titleKey: 'login',
    subtitleKey: 'login_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['buttons']!,
    icon: Icons.smart_button_outlined,
    titleKey: 'botones',
    subtitleKey: 'botones_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['cards']!,
    icon: Icons.credit_card,
    titleKey: 'tarjetas',
    subtitleKey: 'tarjetas_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['progress']!,
    icon: Icons.refresh_rounded,
    titleKey: 'progress_indicators',
    subtitleKey: 'progress_indicators_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['snackbars']!,
    icon: Icons.info_outline,
    titleKey: 'snackbars_dialogs',
    subtitleKey: 'snackbars_dialogs_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['animated']!,
    icon: Icons.check_box_outline_blank_rounded,
    titleKey: 'animated_container',
    subtitleKey: 'animated_container_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['ui-controls']!,
    icon: Icons.car_rental_outlined,
    titleKey: 'ui_controls_tiles',
    subtitleKey: 'ui_controls_tiles_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['tutorial']!,
    icon: Icons.accessible_rounded,
    titleKey: 'app_tutorial',
    subtitleKey: 'app_tutorial_subtitle',
  ),
  MenuItem(
    link: widgetRoutes['infinite']!,
    icon: Icons.list_alt_rounded,
    titleKey: 'infinite_scroll_pull',
    subtitleKey: 'infinite_scroll_pull_subtitle',
  ),
];
