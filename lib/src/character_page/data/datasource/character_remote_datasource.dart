import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/src/character_page/data/models/character_model.dart';

class CharacterRemoteDataSource {
  http.Client client;

  CharacterRemoteDataSource({required this.client});

  Future<List<CharacterModel>> fetchCharacters(int page,
      {bool onlyFromCache = false}) async {
    final url =
        Uri.parse('https://rickandmortyapi.com/api/character?page=$page');
    final cacheManager = DefaultCacheManager();

    try {
      var file = await cacheManager.getFileFromCache(url.toString());
      if (file != null) {
        String cachedData = await file.file.readAsString();
        return _parseCharacters(cachedData);
      } else if (onlyFromCache) {
        return [];
      }
    } catch (e) {
      if (onlyFromCache) {
        return [];
      }
    }

    return _fetchFromNetwork(url);
  }

  Future<List<CharacterModel>> _fetchFromNetwork(Uri url) async {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      await DefaultCacheManager()
          .putFile(url.toString(), response.bodyBytes, fileExtension: "json");
      return _parseCharacters(response.body);
    } else {
      throw Exception('Failed to load characters');
    }
  }

  List<CharacterModel> _parseCharacters(String responseBody) {
    final jsonData = json.decode(responseBody);
    final List<dynamic> results = jsonData['results'];
    return results
        .map((dynamic item) => CharacterModel.fromJson(item))
        .toList();
  }
}
