// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/src/character_page/domain/usecases/get_all_characters.dart';

import '../../domain/entities/character.dart';

import 'package:mobx/mobx.dart';
part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

abstract class _CharacterStoreBase with Store {
  final GetAllCharacters getAllCharacters = Modular.get<GetAllCharacters>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  int currentPage = 1;

  @computed
  bool get isLastPage => characters.isEmpty;

  @action
  Future<void> fetchCharacters(int page) async {
    isLoading = true;
    try {
      final fetchedCharacters = await getAllCharacters.call(page);

      if (page == 1) {
        characters.clear();
      }

      characters.addAll(fetchedCharacters);
      currentPage = page;
    } catch (e) {
      log('Error fetching characters: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadMoreCharacters() async {
    if (!isLoading && !isLastPage) {
      await fetchCharacters(currentPage + 1);
    }
  }

  @action
  Future<void> refreshCharacters() async {
    currentPage = 1; // Reseta para a primeira página
    await fetchCharacters(currentPage);
    // Começa a carregar os dados para o scroll ficar invisível
    await updateDataInBackground();
  }

  @action
  Future<void> updateDataInBackground() async {
    int nextPage = 1;
    bool shouldContinue = true;
    int pageSize = 20; // API retorna 20 itens por página

    while (shouldContinue) {
      await fetchCharacters(nextPage);
      shouldContinue =
          characters.length == nextPage * pageSize; // conforme a API

      nextPage++;
    }
  }
}
