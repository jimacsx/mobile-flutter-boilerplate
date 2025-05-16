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
    title: 'Login',
    subtitle: 'Pantalla login',
    link: publicRoutes['login']!,
    icon: Icons.login
  ),

];
