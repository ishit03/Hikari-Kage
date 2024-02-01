import 'dart:convert';

import 'package:hikari_kage/data/anime_provider.dart';
import 'package:hikari_kage/models/anime.dart';
import 'package:hikari_kage/models/character.dart';

class AnimeRepo {
  final AnimeProvider _animeProvider = AnimeProvider();

  ///Fetch top ranked animes by given type such as Popularity, Currently Airing, All time etc.
  Future<List<Anime>> fetchTopAnimeList(String rankType) async {
    final jsonMap = await _animeProvider
        .fetchTopAnime(rankType)
        .then((value) => jsonDecode(value) as Map<String, dynamic>);
    if (jsonMap.containsKey('data')) {
      final dataMap = (jsonMap['data'] as List).cast<Map<String, dynamic>>();
      final List<Anime> animeList =
          dataMap.map((e) => Anime.fromJson(e['node'])).toList();
      return animeList;
    } else {
      return [];
    }
  }

  Future<List> fetchTopAnimesByType() async {
    final topAnimes = await Future.wait([
      fetchTopAnimeList('all'),
      fetchTopAnimeList('airing'),
      fetchTopAnimeList('upcoming'),
      fetchTopAnimeList('bypopularity')
    ]);

    return topAnimes;
  }

  ///Fetch details of a particular anime by Id
  Future<Anime> fetchAnimeDetails(int animeId) async {
    late final String jsonString;
    jsonString = await _animeProvider.fetchAnimeFromId(animeId);
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    jsonMap.update('genres', getGenreList);
    jsonMap.update('studios', (value) => value[0]['name'] as String);

    final List<Character> characterList = await getCharactersList(animeId);
    jsonMap['characters'] = characterList;

    final Anime anime = Anime.fromJson(jsonMap);

    return anime;
  }

  ///Fetch list of characters of an Anime which will be added to the characters field of Anime class
  Future<List<Character>> getCharactersList(int animeId) async {
    final List<Character> characterList = await _animeProvider
        .fetchAnimeCharacters(animeId)
        .then((value) => jsonDecode(value) as Map<String, dynamic>)
        .then((value) => (value['data'] as List).cast<Map<String, dynamic>>())
        .then((value) => value.map((e) => Character.fromJson(e)).toList());
    return characterList;
  }

  ///Genres are received as List<Map<>> which contains id and genre name.
  ///This function converts it to List<String> which contains only genre name.
  List<String> getGenreList(dynamic json) {
    final jsonMap = (json as List).cast<Map<String, dynamic>>();
    List<String> genres = jsonMap.map((e) => e['name']).toList().cast<String>();
    return genres;
  }
}
