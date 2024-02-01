import 'package:hikari_kage/secret/api_secret.dart' as api;
import 'package:http/http.dart' as http;

///Data provider class to fetch data from MAL API
class AnimeProvider {
  final String _apiUrl = "https://api.myanimelist.net/v2/";
  final String _animeFields =
      "title,genres,main_picture,rank,mean,synopsis,studios,rating,media_type,status";
  final String _characterFields = "first_name,last_name,role,main_picture";
  final Map<String, String> _apiHeaders = {'X-MAL-CLIENT-ID': api.getApiSecret};
  AnimeProvider();

  Future<String> fetchTopAnime(String rankType) async {
    return await http
        .get(
            Uri.parse(
                '${_apiUrl}anime/ranking?ranking_type=$rankType&limit=10'),
            headers: _apiHeaders)
        .then((res) => res.body);
  }

  Future<String> fetchAnimeFromId(int id) async {
    return await http
        .get(Uri.parse('${_apiUrl}anime/$id?fields=$_animeFields'),
            headers: _apiHeaders)
        .then((res) => res.body);
  }

  Future<String> fetchAnimeByName(String name) async {
    return await http
        .get(Uri.parse('${_apiUrl}anime?q=$name&limit=10'),
            headers: _apiHeaders)
        .then((res) => res.body);
  }

  Future<String> fetchAnimeCharacters(int animeId) async {
    return await http
        .get(
            Uri.parse(
                '${_apiUrl}anime/$animeId/characters?fields=$_characterFields'),
            headers: _apiHeaders)
        .then((res) => res.body);
  }
}
