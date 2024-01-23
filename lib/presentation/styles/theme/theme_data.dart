import 'package:flutter/material.dart';
import 'package:weather/presentation/styles/style.dart';

 AppBarTheme appBarLightTheme = AppBarTheme(
  backgroundColor: Style.primary,
  elevation: 0,
  iconTheme: const IconThemeData(color: Style.black),
  titleTextStyle: Style.poppinsMedium(size: 16),
);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: MaterialStateProperty.all(Style.primary),
);

DataTableThemeData dataTableLightThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Style.greyscale800),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    border: Border.all(color: Style.greyscale800),
  ),
  dataTextStyle: Style.poppinsMedium(size: 12),
);
