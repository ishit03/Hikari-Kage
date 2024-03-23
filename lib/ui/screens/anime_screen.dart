import 'package:flutter/material.dart';
import 'package:hikari_kage/ui/widgets/home_screen_widgets/top_anime_section.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TopAnimeSection(listTitle: 'Top Airing', listKey: 'topAiring'),
        const TopAnimeSection(listTitle: 'Top Anime', listKey: 'topAll'),
        const TopAnimeSection(
            listTitle: 'Upcoming Anime', listKey: 'upcomingAnime'),
        const TopAnimeSection(
            listTitle: 'Most Popular', listKey: 'mostPopular'),
        Center(
          child: Text(
            'Powered by MAL',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontFamily: 'Caveat'),
          ),
        )
      ],
    );
  }
}
