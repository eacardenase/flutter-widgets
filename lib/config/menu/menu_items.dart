import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh,
  ),
  MenuItem(
    title: 'Snackbars and Dialogs',
    subTitle: 'On Screen indicators',
    link: '/snackbars',
    icon: Icons.info,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Animations - Basics',
    link: '/animated',
    icon: Icons.animation,
  ),
];
