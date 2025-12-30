import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_text.dart';

class RadioActionButtons extends StatelessWidget {
  final bool isSelected;
  final Function(bool) onChange;

  const RadioActionButtons({
    super.key,
    required this.isSelected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Row(
      spacing: width * 0.03,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: height * 0.01),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              backgroundColor: WidgetStateProperty.all(
                isSelected ? AppColors.goldColor : AppColors.appColor,
              ),
            ),
            onPressed: () => onChange(true),
            child: Text(
              "Radio",
              style: isSelected ? AppText.black16Text : AppText.white16Text,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: height * 0.01),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              backgroundColor: WidgetStateProperty.all(
                isSelected ? AppColors.appColor : AppColors.goldColor,
              ),
            ),
            onPressed: () => onChange(false),
            child: Text(
              "Reciters",
              style: isSelected ? AppText.white16Text : AppText.black16Text,
            ),
          ),
        ),
      ],
    );
  }
}
