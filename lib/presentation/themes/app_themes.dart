import 'package:flutter/material.dart';
import '../../domain/models/theme_type.dart';
import 'local_theme.dart';
import 'resources/app_theme_data.dart';
import 'resources/dark_theme_colors.dart';
import 'resources/light_theme_colors.dart';

class AppThemes {
  static LocalTheme get light => LightTheme();
  static LocalTheme get dark => DarkTheme();

  static LocalTheme getAppTheme(ThemeType themeType) {
    return switch (themeType) {
      ThemeType.light => light,
      ThemeType.dark => dark,
    };
  }
}

class LightTheme extends LocalTheme {
  LightTheme()
      : super(
          themeData: AppThemeData(
            Brightness.light,
            LightThemeColors(),
            8.0,
          ),
        );
}

class DarkTheme extends LocalTheme {
  DarkTheme()
      : super(
          themeData: AppThemeData(
            Brightness.dark,
            DarkThemeColors(),
            8.0,
          ),
        );
}
