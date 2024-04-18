import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/src/character_page/data/models/character_model.dart';
import 'package:rickandmorty/src/character_page/data/models/info_model.dart';

class CharacterRemoteDataSource {
  http.Client client;

  CharacterRemoteDataSource({required this.client});

  // Essa é a função principal que é chamada externamente para obter os personagens. Ela recebe um número de página e uma flag opcional onlyFromCache.
  Future<List<CharacterModel>> fetchCharacters(int page,
      {bool onlyFromCache = false}) async {
    final url =
        Uri.parse('https://rickandmortyapi.com/api/character?page=$page');
    final cacheManager = DefaultCacheManager();

    // Tentativa de obter dados do cache
    if (onlyFromCache) {
      return _getCharactersFromCache(cacheManager, url);
    }

    return _getCharactersWithFallbackToNetwork(cacheManager, url);
  }

//Essa função tenta obter os dados dos personagens exclusivamente do cache.
  Future<List<CharacterModel>> _getCharactersFromCache(
      DefaultCacheManager cacheManager, Uri url) async {
    try {
      var file = await cacheManager.getFileFromCache(url.toString());
      if (file != null) {
        //Populando o info (Dados da api count, pages e etc..)
        _parseInfo(await file.file.readAsString());
        // Populando os results (Dados dos personagens)
        return _parseCharacters(await file.file.readAsString());
      }
    } catch (e) {
      if (kDebugMode) {
        print('Cache read error: $e');
      }
    }
    return [];
  }

//Essa função tenta obter dados do cache primeiro e, se não for bem-sucedida, faz uma chamada de rede.
  Future<List<CharacterModel>> _getCharactersWithFallbackToNetwork(
      DefaultCacheManager cacheManager, Uri url) async {
    try {
      var file = await cacheManager.getFileFromCache(url.toString());
      if (file != null) {
        //Populando o info (Dados da api count, pages e etc..)
        _parseInfo(await file.file.readAsString());
        // Populando os results (Dados dos personagens)
        return _parseCharacters(await file.file.readAsString());
      }
    } catch (e) {
      if (kDebugMode) {
        print('Cache read error: $e');
      }
    }

    return _fetchFromNetwork(cacheManager, url);
  }

//Esta função é chamada para obter dados diretamente da API quando o cache é insuficiente ou não está disponível.
  Future<List<CharacterModel>> _fetchFromNetwork(
      DefaultCacheManager cacheManager, Uri url) async {
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        await cacheManager.putFile(url.toString(), response.bodyBytes,
            fileExtension: "json");

        log('>> ${response.body}');
        _parseInfo(response.body);
        return _parseCharacters(response.body);
      }
      if (kDebugMode) {
        print('Network request failed: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Network error: $e');
      }
    }
    throw Exception('Failed to load characters');
  }

//Função auxiliar para converter a resposta JSON em uma lista de objetos CharacterModel.
  List<CharacterModel> _parseCharacters(String responseBody) {
    final jsonData = json.decode(responseBody);
    final List<dynamic> results = jsonData['results'];
    return results
        .map((dynamic item) => CharacterModel.fromJson(item))
        .toList();
  }

  List<InfoModel> _parseInfo(String responseBody) {
    final jsonData = json.decode(responseBody);
    final Map<String, dynamic> results = jsonData['info'];
    return [InfoModel.fromJson(results)];
  }
}
