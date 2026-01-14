import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import '../utils/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return IntroductionScreen(
      globalBackgroundColor: AppColors.appColor,
      pages: [
        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: height * 0.22,
            width: width * 0.75,
          ),
          bodyWidget: Column(
            spacing: height * 0.08,
            children: [
              Image.asset(
                AppAssets.titleImageOnBoarding2,
                width: width * 0.8,
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome To Islami App",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06,
                ),
              ),
            ],
          ),
        ),

        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: height * 0.22,
            width: width * 0.75,
          ),
          bodyWidget: Column(
            spacing: height * 0.05,
            children: [
              Image.asset(
                AppAssets.titleImageOnBoarding3,
                width: width * 0.8,
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome To Islami App",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06,
                ),
              ),
              Text(
                "We Are Very Excited To Have You In Our Community",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),

        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: height * 0.22,
            width: width * 0.75,
          ),
          bodyWidget: Column(
            spacing: height * 0.05,
            children: [
              Image.asset(
                AppAssets.titleImageOnBoarding4,
                width: width * 0.8,
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
              Text(
                "Reading the Quran",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06,
                ),
              ),
              Text(
                "Read, and your Lord is the Most Generous",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),

        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: height * 0.22,
            width: width * 0.75,
          ),
          bodyWidget: Column(
            spacing: height * 0.05,
            children: [
              Image.asset(
                AppAssets.titleImageOnBoarding5,
                width: width * 0.8,
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
              Text(
                "Bearish",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06,
                ),
              ),
              Text(
                "Praise the name of your Lord, the Most High",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),

        PageViewModel(
          titleWidget: Image.asset(
            AppAssets.titleImageOnBoarding,
            height: height * 0.22,
            width: width * 0.75,
          ),
          bodyWidget: Column(
            spacing: height * 0.05,
            children: [
              Image.asset(
                AppAssets.titleImageOnBoarding6,
                width: width * 0.8,
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
              Text(
                "Holy Quran Radio",
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06,
                ),
              ),
              Text(
                "You can listen to the Holy Quran Radio through the application for free and easily",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),
      ],

      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(color: AppColors.goldColor, fontSize: width * 0.045),
      ),
      next: Text(
        "Next",
        style: TextStyle(color: AppColors.goldColor, fontSize: width * 0.045),
      ),
      done: Text(
        "Finish",
        style: TextStyle(color: AppColors.goldColor, fontSize: width * 0.045),
      ),

      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreenName);
      },

      dotsDecorator: DotsDecorator(
        color: AppColors.greyColor,
        activeColor: AppColors.goldColor,
        size: Size(width * 0.02, height * 0.01),
        activeSize: Size(width * 0.05, height * 0.01),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
