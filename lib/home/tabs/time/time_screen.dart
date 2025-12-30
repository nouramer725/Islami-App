import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/time/azkar_widget.dart';
import 'package:islami_app/home/tabs/time/pray_time_widget.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          bottom: height * 0.02,
        ),
        child: Column(
          spacing: height * 0.02,
          children: [PrayTimeWidget(), AzkarWidget()],
        ),
      ),
    );
  }
}
