import 'package:flutter/material.dart' show IconData, Icons;

import 'package:widgets_app/presentation/screens/screens.dart';

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
    title: 'Riverpod Counter',
    subTitle: 'State management made simple',
    link: CounterScreen.name,
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: ButtonsScreen.name,
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: CardsScreen.name,
    icon: Icons.card_giftcard,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: ProgressScreen.name,
    icon: Icons.refresh,
  ),
  MenuItem(
    title: 'Snackbars and Dialogs',
    subTitle: 'On Screen indicators',
    link: SnackbarScreen.name,
    icon: Icons.info,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Animations - Basics',
    link: AnimatedScreen.name,
    icon: Icons.animation,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controlles de Flutter',
    link: UIControlsScreen.name,
    icon: Icons.car_rental,
  ),
  MenuItem(
    title: 'Onboarding',
    subTitle: 'App Tutorial',
    link: AppTutorialScreen.name,
    icon: Icons.accessibility,
  ),
  MenuItem(
    title: 'Infinite Scroll & Pull',
    subTitle: 'Listas infinitas y Pull to refresh',
    link: InfiniteScrollScreen.name,
    icon: Icons.list,
  ),
  MenuItem(
    title: 'Change App Theme',
    subTitle: 'Change the application color theme',
    link: ThemeChangerScreen.name,
    icon: Icons.color_lens_outlined,
  ),
];
