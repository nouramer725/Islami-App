import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class SearchWidget extends StatelessWidget {
  void Function(String)? onChanged;
  SearchWidget({required this.onChanged,super.key});

  @override
  Widget build(BuildContext context) {
    return    TextField(
      cursorColor: AppColors.appColor,
      style: AppText.white16Text,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Sura Name",
        hintStyle: AppText.white16Text,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            AppAssets.quranIcon,
            color: AppColors.goldColor,
          ),
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: AppColors.goldColor,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    );
  }

}
