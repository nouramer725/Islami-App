import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen_content.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen_content_container.dart';
import 'package:islami_app/home/tabs/quran/sura_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_text.dart';
import 'package:islami_app/utils/most_recent_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  String content = '';
  bool isContainerView = false;
  int selectedAyahIndex = -1;
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getLastSuraIndex();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    if (verses.isEmpty) loadSuraDetailsContainer(index);
    if (content.isEmpty) loadSuraDetails(index);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: Text(
          SuraResources.englishQuranSurahs[index],
          style: AppText.bold20AppColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isContainerView = !isContainerView;
              });
            },
            icon: Icon(
              isContainerView
                  ? Icons.cameraswitch_sharp
                  : Icons.cameraswitch_outlined,
              color: AppColors.goldColor,
            ),
          ),
        ],
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
                child:
                    isContainerView
                        ? (verses.isEmpty
                            ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.goldColor,
                              ),
                            )
                            : ListView.builder(
                              itemCount: verses.length,
                              itemBuilder: (context, i) {
                                return SuraDetailsScreenContentContainer(
                                  index: i,
                                  content: verses[i],
                                  isSelected: selectedAyahIndex == i,
                                  onTap: () {
                                    setState(() {
                                      selectedAyahIndex = i;
                                    });
                                  },
                                );
                              },
                            ))
                        : content.isEmpty
                        ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.goldColor,
                          ),
                        )
                        : SingleChildScrollView(
                          child: SuraDetailsScreenContent(
                            index: index,
                            content: content,
                          ),
                        ),
              ),
              Image.asset(AppAssets.imgBottomDecoration),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraDetails(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/Suras/${index + 1}.txt",
    );
    List<String> lines = fileContent.split("\n");
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}] ';
    }
    content = lines.join();
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  void loadSuraDetailsContainer(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/Suras/${index + 1}.txt",
    );
    List<String> lines = fileContent.split("\n");
    verses = lines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
