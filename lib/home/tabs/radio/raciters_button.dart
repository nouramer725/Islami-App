import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class RacitersButton extends StatelessWidget {
  const RacitersButton({super.key});

  // bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: height * 0.02);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.goldColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(AppAssets.imgBottomRadio, fit: BoxFit.fill),
                Column(
                  spacing: height * 0.025,
                  children: [
                    Text(textAlign: TextAlign.center,"Akram Alalaqmi", style: AppText.black20Text),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                            color: AppColors.appColor,
                            size: width * 0.1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // isClicked = !isClicked;
                            // setState(() {});
                          },
                          icon: Icon(
                            // isClicked ? Icons.volume_off : Icons.volume_up,
                            Icons.volume_up,
                            color: AppColors.appColor,
                            size: width * 0.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
