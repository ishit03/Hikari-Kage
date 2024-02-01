import 'package:flutter/material.dart';
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
                      pageBuilder: (context, _, __) => AnimeSearch(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                      transitionDuration: const Duration(milliseconds: 300)));
                }),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopAnimeSection(title: 'Top Airing', listKey: 'topAiring'),
              TopAnimeSection(title: 'Top Anime', listKey: 'topAll'),
              TopAnimeSection(
                  title: 'Upcoming Anime', listKey: 'upcomingAnime'),
              TopAnimeSection(title: 'Most Popular', listKey: 'mostPopular'),
            ],
          ),
        ));
  }
}
