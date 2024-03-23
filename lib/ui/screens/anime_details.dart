import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/theme_mode_cubit.dart';
import 'package:hikari_kage/models/anime.dart';
import 'package:hikari_kage/repository/anime_repo.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/anime_details_top_section.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/characters_list.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/genre_section.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/synopsis_section.dart';
import 'package:hikari_kage/ui/widgets/general_widgets/hikari_kage_loader.dart';

class AnimeDetails extends StatelessWidget {
  AnimeDetails(
      {required this.animeId, required this.backgroundImage, super.key});
  final int animeId;
  final String backgroundImage;

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final currentTheme = context.read<ThemeModeCubit>().state;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: (currentTheme == Modes.light)
              ? Colors.white.withOpacity(0.9)
              : Colors.black.withOpacity(0.9),
          image: DecorationImage(
              image: NetworkImage(backgroundImage),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  (currentTheme == Modes.light)
                      ? Colors.white.withOpacity(0.9)
                      : Colors.black.withOpacity(0.8),
                  BlendMode.srcATop))),
      child: FutureBuilder(
        future: AnimeRepo().fetchAnimeDetails(animeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: HikariKageLoader(),
            );
          } else if (snapshot.hasData) {
            final animeData = snapshot.data!;
            return SingleChildScrollView(
                controller: _controller,
                child: animeDetailsUI(context, animeData));
          } else if (snapshot.hasError || !snapshot.hasData) {
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
          padding: const EdgeInsets.all(5),
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
