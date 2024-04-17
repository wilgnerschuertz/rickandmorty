import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/src/character_page/data/models/character_model.dart';

class CharacterRemoteDataSource {
  http.Client client;

  CharacterRemoteDataSource({required this.client});

  // Future<List<CharacterModel>> fetchCharacters(int page) async {
  //   final response = await client
  //       .get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));

  //   // Iniciando cache manager
  //   final cacheManager = DefaultCacheManager();

  //   try {
  //     var file = await cacheManager.getSingleFile(response.request!.url.path);
  //     String contents = await file.readAsString();
  //     log(contents);

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body) as Map<String, dynamic>;
  //       List<dynamic> results = data['results'];
  //       return results.map((e) => CharacterModel.fromJson(e)).toList();
  //     } else {
  //       // Aqui lançamos a exceção se o status não for 200
  //       throw Exception('Failed to load characters');
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     rethrow;
  //   }
  // }

  Future<List<CharacterModel>> fetchCharacters(int page) async {
    final url =
        Uri.parse('https://rickandmortyapi.com/api/character?page=$page');
    final cacheManager = DefaultCacheManager();

    File file;
    String cachedData;

    try {
      // Tentativa de obter o arquivo do cache
      file = await cacheManager.getSingleFile(url.toString());
      cachedData = await file.readAsString();
      log('Dados carregados do cache');
      log('>>> ${cachedData.length}');
      return _parseCharacters(cachedData);
    } catch (e) {
      log('Cache não encontrado ou dados inválidos no cache. Fazendo requisição HTTP...');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        //Cache antes de processar
        await cacheManager.putFile(url.toString(), response.bodyBytes,
            fileExtension: "json");

        return _parseCharacters(response.body);
      } else {
        throw Exception('Failed to load characters');
      }
    }
  }

  List<CharacterModel> _parseCharacters(String responseBody) {
    var data = jsonDecode(responseBody) as Map<String, dynamic>;
    List<dynamic> results = data['results'];
    return results.map((e) => CharacterModel.fromJson(e)).toList();
  }
}
