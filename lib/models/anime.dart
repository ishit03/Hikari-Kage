import 'package:hive/hive.dart';

import 'character.dart';

part 'anime.g.dart';

@HiveType(typeId: 1)
class Anime {
  @HiveField(0)
  late final int animeId;
  @HiveField(1)
  late final String title;
  @HiveField(2)
  late final String mediumPictureUri;
  @HiveField(3)
  late final String largePictureUri;

  late final String? synopsis;
  late final List<String>? genre;
  late final List<Character>? characters;
  late final String? status;
  late final String? rating;
  late final int? rank;
  late final double? mean;
  late final String? studio;
  late final String? mediaType;

  Anime(
      {required this.animeId,
      required this.title,
      this.synopsis,
      this.genre,
      required this.mediumPictureUri,
      required this.largePictureUri,
      this.characters,
      this.status,
      this.rating,
      this.rank,
      this.mean,
      this.studio,
      this.mediaType});

  factory Anime.fromJson(Map<String, dynamic> jsonData) => Anime(
      animeId: jsonData['id'],
      title: jsonData['title'],
      synopsis: jsonData['synopsis'],
      genre: jsonData['genres'],
      mediumPictureUri: jsonData['main_picture']['medium'],
      largePictureUri: jsonData['main_picture']['large'],
      status: jsonData['status'],
      rating: (jsonData['rating'] as String?)?.toUpperCase() ?? 'N/A',
      rank: jsonData['rank'],
      mean: jsonData['mean'],
      studio: jsonData['studios'],
      mediaType: (jsonData['media_type'] as String?)?.toUpperCase() ?? 'N/A',
      characters: jsonData['characters']);

  @override
  String toString() {
    return 'Anime{animeId: $animeId, title: $title, genre: $genre, mediumPictureUri: $mediumPictureUri, largePictureUri: $largePictureUri, characters: $characters, status: $status, rating: $rating, rank: $rank, mean_score: $mean, studio: $studio, mediaType: $mediaType, synopsis: $synopsis}';
  }
}
