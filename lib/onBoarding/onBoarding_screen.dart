import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

import '../utils/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColors.appColor,
      pages: [
        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: 171,
            width: 291,
          ),
          bodyWidget: Column(
            spacing: 80,
            children: [
              Image.asset(AppAssets.titleImageOnBoarding2, fit: BoxFit.cover),
              Text(
                "Welcome To Islami App",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),

        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: 171,
            width: 291,
          ),
          bodyWidget: Column(
            spacing: 40,
            children: [
              Image.asset(AppAssets.titleImageOnBoarding3, fit: BoxFit.cover),
              Text(
                "Welcome To Islami App",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "We Are Very Excited To Have You In Our Community",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: 171,
            width: 291,
          ),
          bodyWidget: Column(
            spacing: 40,
            children: [
              Image.asset(AppAssets.titleImageOnBoarding4, fit: BoxFit.cover),
              Text(
                "Reading the Quran",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "Read, and your Lord is the Most Generous",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: 171,
            width: 291,
          ),
          bodyWidget: Column(
            spacing: 40,
            children: [
              Image.asset(AppAssets.titleImageOnBoarding5, fit: BoxFit.cover),
              Text(
                "Bearish",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "Praise the name of your Lord, the Most High",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: 171,
            width: 291,
          ),
          bodyWidget: Column(
            spacing: 40,
            children: [
              Image.asset(AppAssets.titleImageOnBoarding6, fit: BoxFit.cover),
              Text(
                "Holy Quran Radio",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "You can listen to the Holy Quran Radio through the application for free and easily",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],

      showBackButton: true,
      back: Text("Back", style: TextStyle(color: AppColors.goldColor)),
      next: Text("Next", style: TextStyle(color: AppColors.goldColor)),
      done: Text("Finish", style: TextStyle(color: AppColors.goldColor)),

      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreenName);
      },

      dotsDecorator: DotsDecorator(
        color: AppColors.greyColor,
        activeColor: AppColors.goldColor,
        size: Size(7, 20),
        activeSize: Size(25, 7),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
