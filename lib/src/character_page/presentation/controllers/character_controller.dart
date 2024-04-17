// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api
import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/character.dart';
import '../../domain/usecases/get_all_characters.dart';
part 'character_controller.g.dart';

class CharacterController = _CharacterControllerBase with _$CharacterController;

abstract class _CharacterControllerBase with Store {
  final getAllCharacters = Modular.get<GetAllCharacters>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  int currentPage = 1; // Controlle de paginação (Iniciando sempre na primeira)

  @action
  Future<void> fetchCharacters(int page) async {
    // isLoading = true;

    try {
      final fetchedCharacters = await getAllCharacters(page);
      log('${fetchedCharacters.length} characters fetched');

      if (page == 1) {
        isLoading = true;
        // await Future.delayed(const Duration(seconds: 5));
        characters.clear();
        isLoading = false;
      }

      characters.addAll(fetchedCharacters); // Adiciona novos personagens
      currentPage = page;

      // characters = ObservableList.of(fetchedCharacters);
    } catch (e) {
      // Handle exceptions, possibly show an error message
    }
  }

  @action
  Future<void> loadMoreCharacters() async {
    fetchCharacters(currentPage + 1);
  }
}
