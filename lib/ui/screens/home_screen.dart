import 'package:flutter/material.dart';
import 'package:hikari_kage/ui/widgets/top_anime_section.dart';

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
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
