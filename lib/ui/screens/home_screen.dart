import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_cubit.dart';
import 'package:hikari_kage/cubits/home_screen_state.dart';
import 'package:hikari_kage/cubits/theme_mode_cubit.dart';
import 'package:hikari_kage/ui/screens/anime_screen.dart';
import 'package:hikari_kage/ui/screens/anime_search.dart';
import 'package:hikari_kage/ui/screens/manga_screen.dart';
import 'package:hikari_kage/ui/screens/user_watch_list_screen.dart';
import 'package:hikari_kage/ui/widgets/general_widgets/hikari_kage_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Hikari Kage',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontFamily: 'Caveat'),
          ),
          actions: [
            IconButton(
                onPressed: () => context.read<ThemeModeCubit>().changeTheme(),
                icon: (context.read<ThemeModeCubit>().state == Modes.light)
                    ? const Icon(Icons.dark_mode_outlined, size: 20)
                    : const Icon(Icons.light_mode_outlined, size: 20)),
            IconButton(
                icon: const Icon(Icons.search, size: 20),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder<dynamic>(
                      pageBuilder: (context, _, __) => const AnimeSearch(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              )));
                }),
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            SingleChildScrollView(
                controller: _scrollController,
                child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
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
                padding: const EdgeInsets.all(8),
                child: HikariKageBottomNav(
                  scrollController: _scrollController,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        context.read<HomeScreenCubit>().loadMangaScreenState();
                      case 1:
                        context.read<HomeScreenCubit>().loadAnimeScreenState();
                      case 2:
                        context
                            .read<HomeScreenCubit>()
                            .loadUserWatchlistState();
                    }
                  },
                ),
              ),
            )
          ]),
        ));
  }
}
