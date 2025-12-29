import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class SuraDetailsScreenContentContainer extends StatelessWidget {
  const SuraDetailsScreenContentContainer({
    required this.index,
    required this.content,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final int index;
  final String content;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: height * 0.03,
          vertical: width * 0.02,
        ),
        padding: EdgeInsets.symmetric(vertical: width * 0.01),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.goldColor : AppColors.appColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.goldColor, width: 2),
        ),
        child: Text(
          "[${index + 1}]  $content",
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: isSelected ? AppText.black20Text : AppText.gold20Text,
        ),
      ),
    );
  }
}
