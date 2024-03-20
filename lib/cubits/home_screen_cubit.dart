import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_state.dart';
import 'package:hikari_kage/models/anime.dart';
import 'package:hikari_kage/repository/anime_repo.dart';
import 'package:hikari_kage/status.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(AnimeScreenState(status: Status.initial));

  final _animeRepo = AnimeRepo();
  AnimeScreenState? _animeScreenState;

  Future<void> loadData() async {
    emit(AnimeScreenState(status: Status.loading, topAll: [], topAiring: []));
    final topAnimes = await _animeRepo.fetchTopAnimesByType();
    emit(AnimeScreenState(
        status: Status.loaded,
        topAll: topAnimes[0] as List<Anime>,
        topAiring: topAnimes[1] as List<Anime>,
        upcomingAnime: topAnimes[2] as List<Anime>,
        mostPopular: topAnimes[3] as List<Anime>));
    _animeScreenState = state as AnimeScreenState;
  }

  void loadAnimeScreenState() =>
      emit(_animeScreenState ?? AnimeScreenState.initial());

  void loadUserWatchlistState() => emit(UserWatchlistState());

  void loadMangaScreenState() => emit(MangaScreenState());
}
