import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void _showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('My custom snackbar'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'Irure ex esse cupidatat veniam elit laboris ullamco exercitation mollit fugiat sunt. Consequat veniam consectetur ex sint sunt aliqua elit magna ut occaecat dolor deserunt esse nisi. Velit ad proident ullamco esse occaecat do commodo amet labore est commodo.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              // context.pop();
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => context.pop(), // comes from go_router
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars & Dialogs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCustomSnackbar(context),
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Commodo elit et eiusmod enim veniam veniam ex exercitation labore qui incididunt qui labore. Eiusmod amet do dolor tempor ea ut irure ex esse aliqua. Minim voluptate elit Lorem qui do anim eu ea eu deserunt. Qui laboris id laboris commodo ea sunt esse. Occaecat voluptate occaecat id ut est ea pariatur reprehenderit nulla cupidatat. Do ut irure aliqua nulla ullamco Lorem magna voluptate excepteur magna in nulla veniam.',
                    )
                  ],
                );
              },
              child: const Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => _openDialog(context),
              child: const Text('Mostrar dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
