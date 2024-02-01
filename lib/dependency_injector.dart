import 'package:hikari_kage/repository/anime_repo.dart';

class DependencyInjector {
  static final _instance = DependencyInjector._internal();

  factory DependencyInjector() => _instance;

  DependencyInjector._internal();

  final AnimeRepo _animeRepo = AnimeRepo();

  AnimeRepo get getAnimeRepoInstance => _animeRepo;
}
