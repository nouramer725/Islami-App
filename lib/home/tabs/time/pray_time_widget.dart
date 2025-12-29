import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_text.dart';

class PrayTimeWidget extends StatelessWidget {
  PrayTimeWidget({super.key});

  List<String> prayName = ["Rise", "Dhuhr", "Asr", "Maghrib", "Isha", "Fajr"];
  List<String> prayTime = [
    "04:30",
    "12:00",
    "01:30",
    "04:00",
    "05:30",
    "07:00"
  ];
  List<String> prayTimePeriod = ["PM", "PM", "PM", "PM", "PM", "AM"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.01,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.containerTimeColor,
        image: DecorationImage(
          image: AssetImage(AppAssets.timeContainer),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: height * 0.05),
        child: Column(
          spacing: height * 0.04,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("16 Jul,", style: AppText.white16Text),
                    Text("2024", style: AppText.white16Text),
                  ],
                ),
                Column(
                  children: [
                    Text("Pray Time", style: AppText.brown20Text),
                    Text("Tuesday", style: AppText.darkBrown20Text),
                  ],
                ),
                Column(
                  children: [
                    Text("09 Muh,", style: AppText.white16Text),
                    Text("1446", style: AppText.white16Text),
                  ],
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: height * 0.15,
                viewportFraction: 0.3,
                initialPage: 2,
                enableInfiniteScroll: false,
              ),
              items:
                  List.generate(5, (index) => index).map((index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.containerColor1,
                            AppColors.containerColor2,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(prayName[index], style: AppText.white16Text),
                          Text(prayTime[index], style: AppText.white32Text),
                          Text(
                            prayTimePeriod[index],
                            style: AppText.white16Text,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
