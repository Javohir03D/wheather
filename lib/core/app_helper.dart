import 'package:flutter/material.dart';
import 'package:weather/presentation/app_assets.dart';
import 'package:weather/presentation/styles/style.dart';

abstract class AppHelper {
  AppHelper._();

  static Color getTextColor(num? tempC) {
    return (tempC ?? 0) < 0
        ? Style.snowyText
        : (tempC ?? 0) < 15
            ? Style.rainyText
            : (tempC ?? 0) < 25
                ? Style.cloudyText
                : Style.sunnyText;
  }

  static String getSvg(num? tempC) {
    return (tempC ?? 0) < 0
        ? Assets.iconsSnowCloud
        : (tempC ?? 0) < 15
            ? Assets.iconsRainy
            : (tempC ?? 0) < 25
                ? Assets.iconsCloud
                : Assets.iconsSun;
  }
}
