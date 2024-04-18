import 'package:rickandmorty/src/character_page/domain/entities/character.dart';

class CharacterState {
  final bool isLoading;
  final String error;
  final List<Character> characters;

  const CharacterState({
    required this.isLoading,
    required this.error,
    required this.characters,
  });

  factory CharacterState.empty() {
    return const CharacterState(
      isLoading: false,
      error: '',
      characters: [],
    );
  }

  CharacterState copyWith({
    bool? isLoading,
    String? error,
    List<Character>? characters,
  }) {
    return CharacterState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      characters: characters ?? this.characters,
    );
  }
}
