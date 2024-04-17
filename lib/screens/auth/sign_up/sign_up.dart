import 'package:fashtask/constants/app_image.dart';
import 'package:fashtask/constants/app_text_style.dart';
import 'package:fashtask/screens/auth/widget/auth_text_field.dart';
import 'package:fashtask/themes/app_color.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.onboardingImage3),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: AppTextStyle.body.copyWith(
                  fontSize: 25,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [
                    AuthTextField(
                      hintText: "Email ",
                    ),
                    SizedBox(height: 20),
                    AuthTextField(
                      hintText: "Password",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
