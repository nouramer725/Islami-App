import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/most_recently_widget.dart';
import 'package:islami_app/home/tabs/quran/search_widget.dart';
import 'package:islami_app/home/tabs/quran/sura_item_builder.dart';
import 'package:islami_app/home/tabs/quran/sura_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_text.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> filterList = List.generate(114, (index) => index);
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: width * 0.03,
        children: [
          SearchWidget(
            onChanged: (newText) {
              searchText = newText;
              searchByText(newText);
            },
          ),
          MostRecentlyWidget(),
          Text("Suras List", style: AppText.white16Text),
          Expanded(
            child:
                filterList.isEmpty
                    ? Center(
                      child: Text(
                        "No Sura Item Found",
                        style: AppText.white16Text,
                      ),
                    )
                    : ListView.separated(
                      itemCount: filterList.length,
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
                        return InkWell(
                          onTap: () {
                            saveLastSuraIndex(filterList[index]);
                            Navigator.pushNamed(
                              context,
                              AppRoutes.suraDetailsScreen,
                              arguments: filterList[index],
                            );
                          },
                          child: SuraItemBuilder(index: filterList[index]),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  void searchByText(String text) {
    List<int> filterSearchList = [];
    for (int i = 0; i < SuraResources.arabicQuranSuras.length; i++) {
      if (SuraResources.arabicQuranSuras[i].toLowerCase().contains(text)) {
        filterSearchList.add(i);
      }
    }
    for (int i = 0; i < SuraResources.englishQuranSurahs.length; i++) {
      if (SuraResources.englishQuranSurahs[i].toLowerCase().contains(text)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;

    setState(() {});
  }
}
