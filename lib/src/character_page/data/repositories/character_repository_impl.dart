import 'dart:developer';

import 'package:rickandmorty/src/character_page/domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasource/character_remote_datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Character>> fetchCharacters(int page) async {
    try {
      final characterModels = await remoteDataSource.fetchCharacters(page);
      log('Repository Impl: ${characterModels.length} characters fetched');
      return characterModels
          .map((model) => Character(
                id: model.id,
                name: model.name,
                status: model.status,
                species: model.species,
                type: model.type,
                gender: model.gender,
                image: model.image,
                episode: List<String>.from(model.episode),
                origin: model.origin,
                location: model.location,
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to load characters from the repository: $e');
    }
  }
}
