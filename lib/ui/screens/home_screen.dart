import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_cubit.dart';
import 'package:hikari_kage/cubits/theme_mode_cubit.dart';
import 'package:hikari_kage/ui/screens/anime_search.dart';
import 'package:hikari_kage/ui/widgets/home_screen_widgets/top_anime_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          create: (_) => HomeScreenCubit(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TopAnimeSection(
                    listTitle: 'Top Airing', listKey: 'topAiring'),
                const TopAnimeSection(
                    listTitle: 'Top Anime', listKey: 'topAll'),
                const TopAnimeSection(
                    listTitle: 'Upcoming Anime', listKey: 'upcomingAnime'),
                const TopAnimeSection(
                    listTitle: 'Most Popular', listKey: 'mostPopular'),
                Center(
                  child: Text(
                    'Powered by MAL',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
