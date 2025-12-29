import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:islami_app/utils/most_recent_provider.dart';
import 'package:provider/provider.dart';
import 'onBoarding/onBoarding_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenName,
      routes: {
        AppRoutes.homeScreenName: (context) => HomeScreen(),
        AppRoutes.onBoardingScreenName: (context) => OnboardingScreen(),
        AppRoutes.suraDetailsScreen: (context) => SuraDetailsScreen(),
        AppRoutes.hadethDetailsScreen: (context) => HadethDetailsScreen(),
      },
    );
  }
}
