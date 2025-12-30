import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_text.dart';
import 'hadeth.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  String content = '';
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (content.isEmpty) loadHadethDetails(index);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: Text('Hadith $index', style: AppText.bold20AppColor),
      ),
      body:
          hadeth == null
              ? Center(
                child: CircularProgressIndicator(color: AppColors.goldColor),
              )
              : Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppAssets.imgLeftDecoration),
                          Text(
                            hadeth?.title ?? '',
                            style: AppText.bold20AppColor,
                          ),
                          Image.asset(AppAssets.imgRightDecoration),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: height * 0.02,
                            vertical: width * 0.01,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              textAlign: TextAlign.center,
                              hadeth?.content ?? '',
                              style: AppText.gold20Text,
                            ),
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

  void loadHadethDetails(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/Hadeeth/h$index.txt",
    );
    int fileIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileIndex);
    String content = fileContent.substring(fileIndex);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    if (!mounted) return;
    setState(() {});
  }
}
