import 'package:flutter/material.dart';
import 'package:hikari_kage/models/character.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({required this.charactersList, super.key});
  final List<Character>? charactersList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
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
                          child: (charactersList?[index].pictureUri != null)
                              ? Image.network(
                                  charactersList?[index].pictureUri ?? '',
                                  fit: BoxFit.contain,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${charactersList?[index].firstName} ${charactersList?[index].lastName}',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Flexible(
                          child: Text(
                        '(${charactersList?[index].role})',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
