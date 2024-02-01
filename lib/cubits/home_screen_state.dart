import '../models/anime.dart';

enum Status {
  initial,
  loading, //Data is being fetched from api
  loaded, //Data has been fetched
  error //Some error occured while fetching data
}

class HomeScreenState {
  final Status status;
  final List<Anime>? topAll;
  final List<Anime>? topAiring;
  final List<Anime>? upcomingAnime;
  final List<Anime>? mostPopular;

  HomeScreenState(
      {required this.status,
      this.topAll,
      this.topAiring,
      this.upcomingAnime,
      this.mostPopular});

  static HomeScreenState initial() => HomeScreenState(status: Status.initial);

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
