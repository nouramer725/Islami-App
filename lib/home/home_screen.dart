import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.quranBg,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppColors.goldColor),
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
                : AppColors.blackColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
