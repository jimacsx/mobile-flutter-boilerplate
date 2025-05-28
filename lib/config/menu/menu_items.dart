import 'package:banking_flutter_app/routing/routes.dart';
// import 'package:flutter/material.dart' show IconData;
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  /// * constructor
  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

final appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Bottom Navigation Bar',
    subtitle: 'BottomBar example',
    link: privateRoutes['bottom-bar']!,
    icon: Icons.border_bottom
  ),

  MenuItem(
    title: 'Drawer',
    subtitle: 'Drawer example',
    link: privateRoutes['drawer']!,
    icon: Icons.menu
  ),

  MenuItem(
    title: 'Riverpod Counter',
    subtitle: 'Introducción a Riverpod',
    link: privateRoutes['counter-riverpod']!,
    icon: Icons.add
  ),

  MenuItem(
    title: 'Cambiar tema',
    subtitle: 'Cambiar tema de la aplicación',
    link: privateRoutes['theme-changer']!,
    icon: Icons.color_lens_outlined
  ),
 
  MenuItem(
    title: 'Login',
    subtitle: 'Pantalla login',
    link: publicRoutes['login']!,
    icon: Icons.login
  ),
  
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: privateRoutes['buttons']!,
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: privateRoutes['cards']!,
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: privateRoutes['progress']!,
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y diálogos',
    subtitle: 'Indicadores en pantalla',
    link: privateRoutes['snackbars']!,
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated container',
    subtitle: 'Stateful widget animado',
    link: privateRoutes['animated']!,
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Una serie de controles de Flutter',
    link: privateRoutes['ui-controls']!,
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'Introducción a la aplicación',
    subtitle: 'Pequeño tutorial introductorio',
    link: privateRoutes['tutorial']!,
    icon: Icons.accessible_rounded
  ),

  MenuItem(
    title: 'InfiniteScroll y Pull',
    subtitle: 'Listas infinitas y pull to refresh',
    link: privateRoutes['infinite']!,
    icon: Icons.list_alt_rounded
  ),
];
