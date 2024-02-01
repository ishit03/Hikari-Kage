import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/anime_search_state.dart';
import 'package:hikari_kage/dependency_injector.dart';

import '../models/anime.dart';
import '../repository/anime_repo.dart';
import '../status.dart';

class AnimeSearchCubit extends Cubit<AnimeSearchState> {
  AnimeSearchCubit() : super(AnimeSearchState(state: Status.initial));

  final AnimeRepo _animeRepo = DependencyInjector().getAnimeRepoInstance;

  void fetchSearchQuery(String query) async {
    emit(AnimeSearchState(state: Status.loading));
    final List<Anime> searchList = await _animeRepo.fetchAnimeByName(query);
    if (searchList.isEmpty) {
      emit(AnimeSearchState(state: Status.error));
    } else {
      emit(AnimeSearchState(state: Status.loaded, searchList: searchList));
    }
  }

  void clearState() {
    state.searchList?.clear();
    emit(AnimeSearchState(state: Status.initial));
  }
}
