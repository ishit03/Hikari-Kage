import 'package:hikari_kage/models/anime.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveUtility {
  static late final Box<dynamic> _cacheBox;
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AnimeAdapter());
    _cacheBox = await Hive.openBox('cacheBox');
  }

  static void closeBoxes() {
    _cacheBox.close();
  }

  ///Utility for caching api responses
  static List<Anime>? checkIfCacheExists(String listName) {
    final timestamp = getLastFetchedTimeStamp;
    if (timestamp != null && timestamp.isAfter(DateTime.now())) {
      return (_cacheBox.get(listName, defaultValue: List<dynamic>.empty())
              as List)
          .cast<Anime>();
    } else {
      return List.empty();
    }
  }

  static void addListToCache(String key, List<Anime> animeList) =>
      _cacheBox.put(key, animeList);

  static void putLastFetchedTimeStamp(DateTime dateTime) =>
      _cacheBox.put('timestamp', dateTime.add(const Duration(hours: 4)));

  static DateTime? get getLastFetchedTimeStamp =>
      _cacheBox.get('timestamp') as DateTime;

  ///Utility for Theme mode
  static String? get getPreferredThemeMode =>
      _cacheBox.get('themeMode') as String;

  static set setPreferredThemeMode(String mode) =>
      _cacheBox.put('themeMode', mode);
}
