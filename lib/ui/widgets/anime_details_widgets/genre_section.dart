import 'package:flutter/material.dart';

import '../custom_chip.dart';

class GenreSection extends StatelessWidget {
  final List<String>? genreList;
  const GenreSection({super.key, required this.genreList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Genres',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Wrap(
                  children: (genreList != null)
                      ? genreList!.map((genre) {
                          return CustomChip(text: genre);
                        }).toList()
                      : [const CustomChip(text: 'N/A')])
            ],
          ),
        ),
      ),
    );
  }
}
