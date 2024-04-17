import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:rickandmorty/src/character_page/data/models/character_model.dart';
import 'package:rickandmorty/src/character_page/data/datasource/character_remote_datasource.dart';

void main() {
  group('fetchCharacters', () {
    test(
        'returns a List of CharacterModel if the http call completes successfully',
        () async {
      final client = MockClient((request) async {
        final response = {
          'results': [
            {
              'id': 1,
              'name': 'Rick Sanchez',
              'status': 'Alive',
              'species': 'Human',
              'type': '',
              'gender': 'Male',
              'image': 'https://url_to_image',
              'episode': ['https://url_to_episode'],
            }
          ]
        };
        return http.Response(jsonEncode(response), 200);
      });

      final dataSource = CharacterRemoteDataSource(client: client);
      final result = await dataSource.fetchCharacters(1);
      expect(result, isA<List<CharacterModel>>());
      expect(result.first.name, equals('Rick Sanchez'));
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      final dataSource = CharacterRemoteDataSource(client: client);
      expect(() async => await dataSource.fetchCharacters(1), throwsException);
    });
  });
}
