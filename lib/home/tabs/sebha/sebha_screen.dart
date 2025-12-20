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
            children: [
              Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppText.white36Text),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppAssets.sebhaScreen),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Text(
                          textAlign: TextAlign.center,
                          sebhas[index],
                          style: AppText.white36Text,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                            if (counter % 33 == 0) {
                              index++;

                              if (index == sebhas.length) {
                                index = 0;
                                counter = 0;
                              }
                            }
                          });
                        },
                        child: Text("$counter", style: AppText.white36Text),
                      ),
                    ],
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
