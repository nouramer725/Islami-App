import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/sura_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_text.dart';

class SuraItemBuilder extends StatelessWidget {
  int index;
  SuraItemBuilder({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      spacing: width * 0.06,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.backgroundImageIndexSura),
            Text("${index + 1}", style: AppText.white16Text),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SuraResources.englishQuranSurahs[index],
                style: AppText.white16Text,
              ),
              Text(
                "${SuraResources.AyaNumber[index]} Verses",
                style: AppText.white16Text,
              ),
            ],
          ),
        ),
        Text(
          SuraResources.arabicQuranSuras[index],
          style: AppText.white16Text,
        ),
      ],
    );
  }
}
