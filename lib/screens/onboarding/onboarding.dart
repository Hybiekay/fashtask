import 'dart:async';
import 'dart:developer';
import 'package:fashtask/screens/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'controller/onboarding_controller.dart';
import 'widget/onboarding_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  late Timer _timer;

  animate() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page == 2) {
        _pageController.jumpToPage(0);
        log("To first Page");
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
        log("to next Page");
      }
    });
  }

  void handleChange() {
    if (_pageController.page == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) {
          return const SignUP();
        }),
      );
    } else {
      _pageController.nextPage(
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeInOut);
    }
  }

  @override
  void initState() {
    animate();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    print("AM Closed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) {},
        children: OnboardingControl.onboardings
            .map(
              (onboardingModel) => OnboardingWidget(
                onboardingModel: onboardingModel,
                onPressed: handleChange,
              ),
            )
            .toList(),
      ),
    );
  }
}
