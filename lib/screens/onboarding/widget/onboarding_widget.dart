import 'package:fashtask/screens/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_text_style.dart';
import '../../../themes/app_color.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingModel onboardingModel;
  final VoidCallback onPressed;
  const OnboardingWidget(
      {super.key, required this.onboardingModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.65,
          width: double.infinity, // 480,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onboardingModel.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: Center(
                child: Text("FT", style: AppTextStyle.body),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            height: MediaQuery.sizeOf(context).height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboardingModel.title,
                  style: AppTextStyle.heading(size: 28),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  onboardingModel.subtitle,
                  style: AppTextStyle.body.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: onPressed,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: AppColor.puple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
