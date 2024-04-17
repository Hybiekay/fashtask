import 'package:fashtask/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle heading(
      {FontWeight fweight = FontWeight.bold,
      double size = 32,
      Color textColor = AppColor.blackGray,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return TextStyle(
        fontSize: size,
        fontWeight: fweight,
        color: textColor,
        fontStyle: fontStyle,
        decoration: decoration);
  }

  static TextStyle body = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.gray,
  );
}
