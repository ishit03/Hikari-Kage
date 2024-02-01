import 'package:flutter/material.dart';

import '../../../models/character.dart';

class CharactersList extends StatelessWidget {
  final List<Character>? charactersList;
  const CharactersList({super.key, required this.charactersList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Characters',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: charactersList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Card(
                          child: Image.network(
                            charactersList?[index].pictureUri ?? '',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '${charactersList?[index].firstName} ${charactersList?[index].lastName}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
