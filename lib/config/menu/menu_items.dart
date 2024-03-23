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
    icon: Icons.card_giftcard,
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
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controlles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental,
  ),
  MenuItem(
    title: 'Onboarding',
    subTitle: 'App Tutorial',
    link: '/onboarding',
    icon: Icons.accessibility,
  ),
  MenuItem(
    title: 'Infinite Scroll & Pull',
    subTitle: 'Listas infinitas y Pull to refresh',
    link: '/infinite_scroll',
    icon: Icons.list,
  ),
];
