import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/home/tabs/quran/sura_item_builder.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import '../../../utils/app_text.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          TextField(
            cursorColor: AppColors.appColor,
            style: AppText.white16Text,
            decoration: InputDecoration(
              hintText: "Sura Name",
              hintStyle: AppText.white16Text,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  AppAssets.quranIcon,
                  color: AppColors.goldColor,
                ),
              ),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
            ),
          ),
          Text("Most Recently", style: AppText.white16Text),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.03);
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Al-Anbia", style: AppText.black24Text),
                          Text("الأنبياء", style: AppText.black24Text),
                          Text("112 verses", style: AppText.black14Text),
                        ],
                      ),
                      Image.asset(AppAssets.reading),
                    ],
                  ),
                );
              },
            ),
          ),
          Text("Suras List", style: AppText.white16Text),
          Expanded(
            child: ListView.separated(
              itemCount: 114,
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  height: 30,
                  thickness: 2,
                  indent: width * 0.06,
                  endIndent: width * 0.06,
                );
              },
              itemBuilder: (context, index) {
                return SuraItemBuilder(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: AppColors.goldColor,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    );
  }
}
