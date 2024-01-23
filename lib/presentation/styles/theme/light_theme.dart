import 'package:flutter/material.dart';
import 'package:weather/presentation/styles/style.dart';
import 'button_theme.dart';
import 'checkbox_themedata.dart';
import 'input_decoration_theme.dart';
import 'theme_data.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Style.primary,
    scaffoldBackgroundColor: Style.primary,
    iconTheme: const IconThemeData(color: Style.black),
    textTheme: TextTheme(
      bodyMedium: Style.poppinsMedium(),
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    textButtonTheme: textButtonThemeData,
    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme: checkboxThemeData.copyWith(
      side: const BorderSide(color: Style.black40),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: Style.primary),
    appBarTheme: appBarLightTheme,
    scrollbarTheme: scrollbarThemeData,
    dataTableTheme: dataTableLightThemeData,
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: Style.primaryMaterialColor)
            .copyWith(
      secondary: Style.secondary,
      primary: Style.primary,
      error: Style.error,
    ),
  );
}
