import 'dart:developer';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rickandmorty/src/character_page/domain/entities/character.dart';
import 'package:rickandmorty/src/character_page/domain/usecases/get_all_characters.dart';
import 'character_state.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

abstract class _CharacterStoreBase with Store {
  final GetAllCharacters getAllCharacters = Modular.get<GetAllCharacters>();

  @observable
  CharacterState state = CharacterState(
    isLoading: false,
    error: '',
    characters: ObservableList<Character>(),
  );

  @computed
  bool get isLastPage => state.characters.isEmpty;

  @action
  Future<void> fetchCharacters(int page) async {
    state.setLoading(true);
    try {
      final fetchedCharacters = await getAllCharacters.call(page);

      if (page == 1) {
        state.clearCharacters();
      }

      state.addCharacters(fetchedCharacters);
    } catch (e) {
      state.setError('Error fetching characters: $e');
      log('Error fetching characters: $e');
    } finally {
      state.setLoading(false);
    }
  }

  @action
  Future<void> loadMoreCharacters() async {
    if (!state.isLoading && !isLastPage) {
      await fetchCharacters(state.characters.length ~/ 20 + 1);
    }
  }

  @action
  Future<void> refreshCharacters() async {
    await fetchCharacters(1);
    // Começa a carregar os dados para o scroll ficar invisível
    await updateDataInBackground();
  }

  @action
  Future<void> updateDataInBackground() async {
    int nextPage = 2;
    bool shouldContinue = true;
    int pageSize = 20; // API retorna 20 itens por página

    while (shouldContinue) {
      await fetchCharacters(nextPage);
      shouldContinue =
          state.characters.length == nextPage * pageSize; // conforme a API

      nextPage++;
    }
  }
}
