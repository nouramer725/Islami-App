import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_text.dart';

import '../../../utils/app_assets.dart';

class HadethTab extends StatefulWidget {
  int index;

  HadethTab({required this.index, super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadethDetails(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadethDetailsScreen,
          arguments: widget.index,
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(AppAssets.hadethScreen),
            fit: BoxFit.fill,
          ),
        ),
        child:
            hadeth == null
                ? CircularProgressIndicator(color: AppColors.appColor)
                : Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.04,
                    left: width * 0.04,
                    right: width * 0.04,
                    bottom: height * 0.08,
                  ),
                  child: Column(
                    children: [
                      Text(hadeth?.title ?? '', style: AppText.black24Text),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            textAlign: TextAlign.center,
                            hadeth?.content ?? '',
                            style: AppText.black16Text,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
    setState(() {});
  }
}
