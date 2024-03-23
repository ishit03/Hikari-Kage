import 'package:hikari_kage/models/character.dart';
import 'package:hive/hive.dart';

part 'anime.g.dart';

@HiveType(typeId: 1)
class Anime {
  Anime(
      {required this.animeId,
      required this.title,
      required this.mediumPictureUri,
      required this.largePictureUri,
      this.synopsis,
      this.genre,
      this.characters,
      this.status,
      this.rating,
      this.rank,
      this.mean,
      this.studio,
      this.mediaType});

  factory Anime.fromJson(Map<String, dynamic> jsonData) => Anime(
      animeId: jsonData['id'] as int,
      title: jsonData['title'] as String,
      synopsis: jsonData['synopsis'] as String?,
      genre: jsonData['genres'] as List<String>?,
      mediumPictureUri: jsonData['main_picture']['medium'] as String,
      largePictureUri: jsonData['main_picture']['large'] as String,
      status: jsonData['status'] as String?,
      rating: (jsonData['rating'] as String?)?.toUpperCase() ?? 'N/A',
      rank: jsonData['rank'] as int?,
      mean: jsonData['mean'] as double?,
      studio: jsonData['studios'] as String?,
      mediaType: (jsonData['media_type'] as String?)?.toUpperCase() ?? 'N/A',
      characters: jsonData['characters'] as List<Character>?);

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

  @override
  String toString() {
    return 'Anime{animeId: $animeId, title: $title, genre: $genre, mediumPictureUri: $mediumPictureUri, largePictureUri: $largePictureUri, characters: $characters, status: $status, rating: $rating, rank: $rank, mean_score: $mean, studio: $studio, mediaType: $mediaType, synopsis: $synopsis}';
  }
}
