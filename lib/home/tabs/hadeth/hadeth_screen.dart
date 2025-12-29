import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'hadeth_tab.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: height * 0.66,
        ),
        items:
            List.generate(50, (index) => index + 1).map((index) {
              return HadethTab(index: index);
            }).toList(),
      ),
    );
  }
}
