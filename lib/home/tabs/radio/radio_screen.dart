import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/radio/raciters_button.dart';
import 'package:islami_app/home/tabs/radio/radio_action_buttons.dart';
import 'package:islami_app/home/tabs/radio/radio_button.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            RadioActionButtons(
              isSelected: isSelected,
              onChange: (value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                  vertical: height * 0.02,
                ),
                child: isSelected ? RadioButton() : RacitersButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
