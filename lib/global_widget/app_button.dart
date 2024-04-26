import 'package:fashtask/constants/app_text_style.dart';
import 'package:fashtask/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.puple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyle.body.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
