import 'package:hive_flutter/hive_flutter.dart';

import '../models/anime.dart';

class HiveUtility {
  static late final Box _cacheBox;
  static late final Box<String> _themeModeBox;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AnimeAdapter());
    _cacheBox = await Hive.openBox('cacheBox');
    _themeModeBox = await Hive.openBox('themeModeBox');
  }

  static void closeBoxes() {
    _cacheBox.close();
    _themeModeBox.close();
  }

  ///Utility for caching api responses
  static List<Anime>? checkIfCacheExists(String listName) {
    final DateTime? timestamp = getLastFetchedTimeStamp;
    if (timestamp != null && timestamp.isAfter(DateTime.now())) {
      return _cacheBox.get(listName, defaultValue: List.empty()).cast<Anime>();
    } else {
      return List.empty();
    }
  }

  static void addListToCache(String key, List<Anime> animeList) =>
      _cacheBox.put(key, animeList);

  static void putLastFetchedTimeStamp(DateTime dateTime) =>
      _cacheBox.put('timestamp', dateTime.add(const Duration(hours: 4)));

  static DateTime? get getLastFetchedTimeStamp => _cacheBox.get('timestamp');

  ///Utility for Theme mode
  static String? get getPreferredThemeMode => _themeModeBox.get('themeMode');

  static set setPreferredThemeMode(String mode) =>
      _themeModeBox.put('themeMode', mode);
}
