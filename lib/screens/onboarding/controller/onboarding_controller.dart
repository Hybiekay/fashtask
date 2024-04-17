import 'package:fashtask/screens/onboarding/model/onboarding_model.dart';

import '../../../constants/app_image.dart';

class OnboardingControl {
  static List<OnboardingModel> onboardings = [
    OnboardingModel(
      title: "Welcome to FashTask!",
      subtitle: "Streamline Your Design Process and Daily Tasks",
      image: AppImage.onboardingImage,
    ),
    OnboardingModel(
      title: "Efficiently Manage Customer Measurements",
      subtitle: "Organize and Access Measurements Anytime, Anywhere",
      image: AppImage.onboardingImage2,
    ),
    OnboardingModel(
      title: "Stay on Top of Your Daily Tasks",
      subtitle: "Boost Productivity with FashTask's Task Management Features",
      image: AppImage.onboardingImage3,
    ),
  ];
}
