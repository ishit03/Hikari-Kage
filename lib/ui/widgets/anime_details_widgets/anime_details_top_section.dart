import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hikari_kage/ui/widgets/anime_details_widgets/custom_chip.dart';

class TopSection extends StatelessWidget {
  const TopSection(
      {required this.pictureUri,
      required this.title,
      required this.mediaType,
      required this.studio,
      required this.rating,
      required this.status,
      required this.rank,
      required this.mean,
      super.key});

  final String pictureUri;
  final String title;
  final String? mediaType;
  final String? studio;
  final String? rating;
  final String? status;
  final int? rank;
  final double? mean;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 150,
            width: 100,
            child: Image.network(
              pictureUri,
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 200,
                  child: Wrap(
                    spacing: 5,
                    children: [
                      CustomChip(
                        text: '#$rank',
                        tooltipText: 'Rank',
                      ),
                      CustomChip(
                        text: '$mean',
                        tooltipText: 'Mean Score',
                      ),
                      CustomChip(text: rating ?? 'N/A', tooltipText: 'Rating'),
                      CustomChip(
                        text: mediaType ?? 'N/A',
                        tooltipText: 'Media Type',
                      ),
                      CustomChip(text: status ?? 'N/A', tooltipText: 'Status'),
                      CustomChip(text: studio ?? 'N/A', tooltipText: 'Studio')
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
