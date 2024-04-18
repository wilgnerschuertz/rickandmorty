import 'package:rickandmorty/src/character_page/domain/entities/character.dart';
import '../repositories/character_repository.dart';

class GetAllCharacters {
  final CharacterRepository repository;

  GetAllCharacters(this.repository);

  Future<List<Character>> call(int page) async {
    return await repository.fetchCharacters(page);
  }
}
