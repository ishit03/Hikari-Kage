import 'package:flutter/material.dart';
import 'package:hikari_kage/dependency_injector.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/anime_details_top_section.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/characters_list.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/genre_section.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/synopsis_section.dart';

import '../../models/anime.dart';

class AnimeDetails extends StatelessWidget {
  final int animeId;
  final String backgroundImage;
  AnimeDetails(
      {super.key, required this.animeId, required this.backgroundImage});

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(backgroundImage),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9), BlendMode.srcATop))),
      child: FutureBuilder(
        future: DependencyInjector()
            .getAnimeRepoInstance
            .fetchAnimeDetails(animeId),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final Anime animeData = snapshot.data;
            return SingleChildScrollView(
                controller: _controller,
                child: animeDetailsUI(context, animeData));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong :(',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.apply(color: Theme.of(context).colorScheme.error),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget animeDetailsUI(BuildContext context, Anime animeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TopSection(
          pictureUri: animeData.mediumPictureUri,
          title: animeData.title,
          rank: animeData.rank,
          mediaType: animeData.mediaType,
          mean: animeData.mean,
          status: animeData.status,
          studio: animeData.studio,
          rating: animeData.rating,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenreSection(genreList: animeData.genre),
                SynopsisSection(synopsisText: animeData.synopsis),
                CharactersList(charactersList: animeData.characters)
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            'Powered by MAL',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        )
      ],
    );
  }
}
