import 'package:flutter/material.dart';
import '../../../utils/app_text.dart';

class SuraDetailsScreenContent extends StatelessWidget {
  SuraDetailsScreenContent({
    required this.index,
    required this.content,
    super.key,
  });
  String content;
  int index;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.03,
        vertical: width * 0.01,
      ),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: AppText.gold20Text,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
