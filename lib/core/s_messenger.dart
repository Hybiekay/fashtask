import 'package:fashtask/themes/app_color.dart';
import 'package:flutter/material.dart';

class ShowSnarBar {
  static error(BuildContext context, String mesaage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesaage),
        backgroundColor: AppColor.red,
      ),
    );
  }

  static succes(BuildContext context, String mesaage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesaage),
        backgroundColor: AppColor.green,
      ),
    );
  }
}
