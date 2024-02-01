import '../models/anime.dart';
import '../status.dart';

class AnimeSearchState {
  final Status state;
  final List<Anime>? searchList;

  AnimeSearchState({required this.state, this.searchList});
}
