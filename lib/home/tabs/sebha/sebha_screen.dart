import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_text.dart';
import '../../../utils/app_assets.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int index = 0;
  int angle = 0;

  List<String> sebhas = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله أكبر",
    "استغفر الله",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: width * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppText.white36Text),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(AppAssets.sebhaHead),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.2),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              counter++;
                              angle++;
                              if (counter % 33 == 0) {
                                index++;

                                if (index == sebhas.length) {
                                  index = 0;
                                  counter = 0;
                                }
                              }
                            });
                          },
                          child: Transform.rotate(
                            angle: -angle / 3,
                            child: Image.asset(AppAssets.sebhaBody),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              sebhas[index],
                              style: AppText.white36Text,
                            ),
                            Text("$counter", style: AppText.white36Text),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
