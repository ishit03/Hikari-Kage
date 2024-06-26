import 'package:hikari_kage/models/anime.dart';
import 'package:hikari_kage/status.dart';

abstract class HomeScreenState {}

class AnimeScreenState extends HomeScreenState {
  AnimeScreenState(
      {required this.status,
      this.topAll,
      this.topAiring,
      this.upcomingAnime,
      this.mostPopular});

  factory AnimeScreenState.initial() =>
      AnimeScreenState(status: Status.initial);
  final Status status;
  final List<Anime>? topAll;
  final List<Anime>? topAiring;
  final List<Anime>? upcomingAnime;
  final List<Anime>? mostPopular;

  List<Anime> fetchList(String key) {
    switch (key) {
      case 'topAll':
        return topAll ?? [];
      case 'topAiring':
        return topAiring ?? [];
      case 'upcomingAnime':
        return upcomingAnime ?? [];
      case 'mostPopular':
        return mostPopular ?? [];
      default:
        return [];
    }
  }
}

class UserWatchlistState extends HomeScreenState {}

class MangaScreenState extends HomeScreenState {}
