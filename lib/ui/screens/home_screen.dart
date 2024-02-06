import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_cubit.dart';
import 'package:hikari_kage/cubits/theme_mode_cubit.dart';
import 'package:hikari_kage/ui/screens/anime_screen.dart';
import 'package:hikari_kage/ui/screens/anime_search.dart';
import 'package:hikari_kage/ui/screens/user_watch_list_screen.dart';
import 'package:hikari_kage/ui/widgets/hikari_kage_bottom_nav.dart';

import '../../cubits/home_screen_state.dart';
import 'manga_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static final ScrollController _scrollController = ScrollController();
  final HomeScreenCubit _homeScreenCubit = HomeScreenCubit();

  static void addListener(Function(ScrollDirection) callback) {
    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;
      if (direction != ScrollDirection.idle) {
        callback(direction);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Hikari Kage',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.search, size: 20),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, _, __) => const AnimeSearch(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                      transitionDuration: const Duration(milliseconds: 300)));
                }),
            IconButton(
                onPressed: () => context.read<ThemeModeCubit>().changeTheme(),
                icon: (context.read<ThemeModeCubit>().state == Modes.light)
                    ? const Icon(Icons.dark_mode_outlined, size: 20)
                    : const Icon(Icons.light_mode_outlined, size: 20))
          ],
        ),
        body: BlocProvider(
            create: (_) => _homeScreenCubit,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
                SingleChildScrollView(
                    controller: _scrollController,
                    child: BlocBuilder(
                      bloc: _homeScreenCubit,
                      builder: (BuildContext context, state) {
                        switch (state) {
                          case AnimeScreenState():
                            return const AnimeScreen();
                          case UserWatchlistState():
                            return const UserWatchListScreen();
                          case MangaScreenState():
                            return const MangaScreen();
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HikariKageBottomNav(
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            _homeScreenCubit.loadMangaScreenState();
                            break;
                          case 1:
                            _homeScreenCubit.loadAnimeScreenState();
                            break;
                          case 2:
                            _homeScreenCubit.loadUserWatchlistState();
                            break;
                        }
                      },
                    ),
                  ),
                )
              ]),
            )));
  }
}
