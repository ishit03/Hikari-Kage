import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/dependency_injector.dart';

import '../status.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());

  final _animeRepo = DependencyInjector().getAnimeRepoInstance;

  void loadData() async {
    emit(HomeScreenState(status: Status.loading, topAll: [], topAiring: []));
    final List topAnimes = await _animeRepo.fetchTopAnimesByType();
    emit(HomeScreenState(
        status: Status.loaded,
        topAll: topAnimes[0],
        topAiring: topAnimes[1],
        upcomingAnime: topAnimes[2],
        mostPopular: topAnimes[3]));
  }
}
