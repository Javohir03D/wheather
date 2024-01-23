import 'package:flutter/material.dart';
import 'package:weather/presentation/styles/style.dart';

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  focusColor: Style.primary,
  errorStyle: Style.poppinsRegular(color: Style.error, size: 14),
  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
  hintStyle: Style.poppinsRegular(color: Style.greyscale500, size: 14),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Style.transparent),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Style.transparent),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Style.primary),
  ),
  errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Style.error),
  ),
);

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}
