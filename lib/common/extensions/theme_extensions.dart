import 'package:flutter/material.dart';
import 'package:card_settings/common/di/injection.dart';
import 'package:card_settings/domain/model/colors/dark_theme_colors.dart';
import 'package:card_settings/domain/model/colors/light_theme_colors.dart';
import 'package:card_settings/domain/model/colors/material_colors.dart';
import 'package:card_settings/domain/model/colors/theme_colors.dart';
import 'package:card_settings/domain/model/storage/storage.dart';

extension ThemeContextExtensions on BuildContext {
  ThemeColors get colors {
    final brightness = Theme.of(this).brightness;
    if (brightness == Brightness.light) {
      return LightThemeColors();
    } else if (brightness == Brightness.dark) {
      return DarkThemeColors();
    }
    return ThemeColors();
  }

  bool get themeMode => getIt<Storage>().theme.call() ?? true;

  ThemeData get darkTheme => ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        primarySwatch: MaterialColors.navyBlue,
        primaryColor: DarkThemeColors().primary,
        scaffoldBackgroundColor: DarkThemeColors().color1,
        shadowColor: DarkThemeColors().onPrimary,
        highlightColor: DarkThemeColors().onPrimary,
      );

  ThemeData get lightTheme => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white, color: Colors.white),
        primarySwatch: MaterialColors.navyBlue,
        primaryColor: LightThemeColors().primary,
        scaffoldBackgroundColor: LightThemeColors().color1,
        shadowColor: LightThemeColors().onPrimary,
        highlightColor: LightThemeColors().onPrimary,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      );
}
