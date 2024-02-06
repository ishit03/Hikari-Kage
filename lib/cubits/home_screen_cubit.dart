import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/dependency_injector.dart';

import '../status.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(AnimeScreenState(status: Status.initial));

  final _animeRepo = DependencyInjector().getAnimeRepoInstance;
  AnimeScreenState? _animeScreenState;

  void loadData() async {
    emit(AnimeScreenState(status: Status.loading, topAll: [], topAiring: []));
    final List topAnimes = await _animeRepo.fetchTopAnimesByType();
    emit(AnimeScreenState(
        status: Status.loaded,
        topAll: topAnimes[0],
        topAiring: topAnimes[1],
        upcomingAnime: topAnimes[2],
        mostPopular: topAnimes[3]));
    _animeScreenState = state as AnimeScreenState;
  }

  void loadAnimeScreenState() =>
      emit(_animeScreenState ?? AnimeScreenState.initial());

  void loadUserWatchlistState() => emit(UserWatchlistState());

  void loadMangaScreenState() => emit(MangaScreenState());
}
