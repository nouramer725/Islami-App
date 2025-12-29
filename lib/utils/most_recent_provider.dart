import 'package:flutter/cupertino.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getLastSuraIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString = prefs.getStringList(key) ?? [];
    mostRecentList =
        mostRecentListAsString.map((index) => int.parse(index)).toList();
    notifyListeners();
  }
}
