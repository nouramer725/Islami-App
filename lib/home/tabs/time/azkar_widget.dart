import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class AzkarWidget extends StatelessWidget {
  AzkarWidget({super.key});
  List<String> titles = [
    "Evening Azkar",
    "Morning Azkar",
    "Walking Azkar",
    "Sleeping Azkar",
  ];
  List<String> images = [
    AppAssets.eveningAzkar,
    AppAssets.morningAzkar,
    AppAssets.walkingAzkar,
    AppAssets.sleepingAzkar,
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: width * 0.03,
        children: [
          Text("Azkar", style: AppText.white16Text),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 185,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
                childAspectRatio: 185 / 259,
              ),
              itemBuilder:
                  (context, index) => Container(
                    padding: EdgeInsets.all(width * 0.01,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.goldColor, width: 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(images[index])),
                        Text(titles[index], style: AppText.white20Text),
                      ],
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
