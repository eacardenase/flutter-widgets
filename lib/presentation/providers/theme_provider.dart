import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/config/theme/app_theme.dart';

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void setColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

final colorListProvider = Provider<List<Color>>((ref) => colors);
