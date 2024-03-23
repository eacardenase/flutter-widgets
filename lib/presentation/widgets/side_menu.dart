import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];

        // context.pop();
        context.pushNamed(menuItem.link);

        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          // padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          padding: EdgeInsets.only(
            top: hasNotch ? 0 : 20,
            left: 20,
            right: 16,
            bottom: 10,
          ),
          child: const Text('Main'),
        ),
        for (var item in appMenuItems.sublist(0, 3))
          NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 28,
            right: 28,
            bottom: 10,
          ),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 16,
            bottom: 10,
          ),
          child: Text('More Options'),
        ),
        for (var item in appMenuItems.sublist(3))
          NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
      ],
    );
  }
}
