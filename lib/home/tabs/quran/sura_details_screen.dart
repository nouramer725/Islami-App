import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/sura_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_text.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: Text(
          SuraResources.englishQuranSurahs[index],
          style: AppText.bold20AppColor,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.imgLeftDecoration),
                    Text(
                      SuraResources.arabicQuranSuras[index],
                      style: AppText.bold24AppColor,
                    ),
                    Image.asset(AppAssets.imgRightDecoration),
                  ],
                ),
              ),
              Spacer(),
              Image.asset(AppAssets.imgBottomDecoration),
            ],
          ),
        ],
      ),
    );
  }
}
