import 'package:rickandmorty/src/character_page/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchCharacters(int page);
}
