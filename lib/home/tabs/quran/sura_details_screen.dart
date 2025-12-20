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
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: loadSura(index, context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No verses found'));
                    }

                    final verses = snapshot.data!;

                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      child: Text(
                        buildSuraText(verses),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: AppText.gold20Text,
                      ),
                    );
                  },
                ),
              ),

              Image.asset(AppAssets.imgBottomDecoration),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<String>> loadSura(int index, BuildContext context) async {
    final content = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/Suras/${index + 1}.txt');

    return content.trim().split('\n');
  }

  String buildSuraText(List<String> verses) {
    return verses
        .asMap()
        .entries
        .map((e) => '[${e.key + 1}] ${e.value}')
        .join(' ');
  }
}
