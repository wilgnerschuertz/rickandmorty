import 'package:mobx/mobx.dart';
import 'package:rickandmorty/src/character_page/domain/entities/character.dart';

part 'character_state.g.dart';

class CharacterState = _CharacterStateBase with _$CharacterState;

abstract class _CharacterStateBase with Store {
  @observable
  bool isLoading;

  @observable
  String error;

  @observable
  ObservableList<Character> characters;

  _CharacterStateBase({
    required this.isLoading,
    required this.error,
    required List<Character> characters,
  }) : characters = ObservableList<Character>.of(characters);

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void setError(String value) => error = value;

  @action
  void setCharacters(List<Character> newCharacters) {
    characters.clear();
    characters.addAll(newCharacters);
  }

  @action
  void addCharacters(List<Character> newCharacters) {
    characters.addAll(newCharacters);
  }

  @action
  void clearCharacters() {
    characters.clear();
  }
}
