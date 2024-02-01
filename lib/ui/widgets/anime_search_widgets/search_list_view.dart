import 'package:flutter/material.dart';
import 'package:hikari_kage/ui/screens/anime_details.dart';

import '../../../models/anime.dart';

class SearchListView extends StatelessWidget {
  final List<Anime> animeList;
  const SearchListView({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: animeList.length,
            shrinkWrap: true,
            itemExtent: 100,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimeDetails(
                        animeId: animeList[index].animeId,
                        backgroundImage: animeList[index].largePictureUri))),
                child: Card(
                  child: Row(
                    children: [
                      Image.network(
                        animeList[index].mediumPictureUri,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(animeList[index].title),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
