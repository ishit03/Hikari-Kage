import 'package:hikari_kage/models/anime.dart';
import 'package:hikari_kage/status.dart';

class AnimeSearchState {
  AnimeSearchState({required this.state, this.searchList});
  final Status state;
  final List<Anime>? searchList;
}
