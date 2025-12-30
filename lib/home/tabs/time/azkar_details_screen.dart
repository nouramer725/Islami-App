// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:islami_app/utils/app_text.dart';
//
// import '../../../utils/app_colors.dart';
//
// class AzkarDetailsScreen extends StatefulWidget {
//   const AzkarDetailsScreen({super.key});
//
//   @override
//   State<AzkarDetailsScreen> createState() => _AzkarDetailsScreenState();
// }
//
// class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
//   List catalogData = [];
//
//   Future<void> loadData() async {
//     final data = await rootBundle.loadString("assets/azkar.json");
//     final decoded = json.decode(data);
//
//     List allAzkar = [];
//
//     for (var item in decoded["أذكار الصباح"]) {
//       if (item is List) {
//         allAzkar.addAll(item);
//       } else {
//         allAzkar.add(item);
//       }
//     }
//
//     await Future.delayed(Duration(seconds: 1));
//     setState(() {
//       catalogData = allAzkar;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final title = ModalRoute.of(context)!.settings.arguments as String;
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(title: Text(title, style: AppText.gold20Text)),
//       body:
//           catalogData.isEmpty
//               ? Center(
//                 child: CircularProgressIndicator(color: AppColors.goldColor),
//               )
//               : ListView.builder(
//                 itemCount: catalogData.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.symmetric(
//                       horizontal: height * 0.03,
//                       vertical: width * 0.04,
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       vertical: width * 0.03,
//                       horizontal: width * 0.04,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.appColor,
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: AppColors.goldColor, width: 2),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           "${catalogData[index]["count"] ?? ""}) ${catalogData[index]["content"] ?? ""}",
//                           textDirection: TextDirection.rtl,
//                           style: AppText.gold20Text,
//                         ),
//                         Visibility(
//                           visible: catalogData[index]["description"] != null,
//                           child: Text(
//                             catalogData[index]["description"] ?? "",
//                             textDirection: TextDirection.rtl,
//                             style: AppText.white16Text,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//     );
//   }
// }
