import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/sura_resources.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_text.dart';
import '../../../utils/most_recent_provider.dart';

class MostRecentlyWidget extends StatefulWidget {
  const MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.getLastSuraIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          Text("Most Recently", style: AppText.white16Text),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              itemCount: mostRecentProvider.mostRecentList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.03);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsScreen,
                      arguments: mostRecentProvider.mostRecentList[index],
                    );
                  },
                  child: Container(
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
                            Text(
                              SuraResources
                                  .englishQuranSurahs[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppText.black24Text,
                            ),
                            Text(
                              SuraResources.arabicQuranSuras[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppText.black24Text,
                            ),
                            Text(
                              '${SuraResources.AyaNumber[mostRecentProvider.mostRecentList[index]]} Verses',
                              style: AppText.black14Text,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.reading),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
