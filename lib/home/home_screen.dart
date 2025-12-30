import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_screen.dart';
import 'package:islami_app/home/tabs/quran/quran_screen.dart';
import 'package:islami_app/home/tabs/radio/radio_screen.dart';
import 'package:islami_app/home/tabs/sebha/sebha_screen.dart';
import 'package:islami_app/home/tabs/time/time_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  List<String> bgImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.goldColor),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                items: [
                  buildBottomNavigationBarItem(
                    icon: AppAssets.quranIcon,
                    label: 'Quran',
                    index: 0,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.hadethIcon,
                    label: "Hadeth",
                    index: 1,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.sebhaIcon,
                    label: "Sebha",
                    index: 2,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.radioIcon,
                    label: "Radio",
                    index: 3,
                  ),
                  buildBottomNavigationBarItem(
                    icon: AppAssets.timeIcon,
                    label: "Time",
                    index: 4,
                  ),
                ],
              ),
            ),
            body: Column(
              spacing: height * 0.01,
              children: [
                Image.asset(AppAssets.titleImageOnBoarding),
                Expanded(child: screens[selectedIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              selectedIndex == index
                  ? AppColors.blackWithOpacityColor
                  : AppColors.transparentColor,
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            selectedIndex == index
                ? AppColors.whiteColor
                : AppColors.appColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
