import 'package:flutter/material.dart';
import 'package:hikari_kage/models/anime.dart';
import 'package:hikari_kage/ui/screens/anime_details.dart';

class ListItem extends StatelessWidget {
  const ListItem({required this.anime, super.key});
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<dynamic>(
              builder: (context) => AnimeDetails(
                  animeId: anime.animeId,
                  backgroundImage: anime.largePictureUri)));
        },
        overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                anime.mediumPictureUri,
                fit: BoxFit.fitHeight,
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  anime.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
