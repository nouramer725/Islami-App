import 'package:shared_preferences/shared_preferences.dart';

String key = 'most_recent_sura';

void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList(key) ?? [];
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    mostRecentList.insert(0, '$newSuraIndex');
  }
  if (mostRecentList.length >= 5) {
    mostRecentList.removeLast();
  }
  await prefs.setStringList(key, mostRecentList);
}
