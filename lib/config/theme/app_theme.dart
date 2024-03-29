import 'package:flutter/material.dart';

const _colors = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(
          selectedColor >= 0 && selectedColor < _colors.length,
          "Must be between 0 and ${_colors.length - 1}",
        );

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: _colors[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );
}
