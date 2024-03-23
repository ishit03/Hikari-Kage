import 'package:flutter/material.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/custom_chip.dart';

class GenreSection extends StatelessWidget {
  const GenreSection({required this.genreList, super.key});
  final List<String>? genreList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Genres',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontFamily: 'Caveat'),
              ),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                  children: (genreList != null)
                      ? genreList!.map((genre) {
                          return CustomChip(
                            text: genre,
                            margin: const EdgeInsets.only(
                              bottom: 5,
                              right: 5,
                            ),
                          );
                        }).toList()
                      : [const CustomChip(text: 'N/A')])
            ],
          ),
        ),
      ),
    );
  }
}
