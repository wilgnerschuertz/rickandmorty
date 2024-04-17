// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterController on _CharacterControllerBase, Store {
  late final _$charactersAtom =
      Atom(name: '_CharacterControllerBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharacterControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_CharacterControllerBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterControllerBase.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters(int page) {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters(page));
  }

  late final _$loadMoreCharactersAsyncAction = AsyncAction(
      '_CharacterControllerBase.loadMoreCharacters',
      context: context);

  @override
  Future<void> loadMoreCharacters() {
    return _$loadMoreCharactersAsyncAction
        .run(() => super.loadMoreCharacters());
  }

  @override
  String toString() {
    return '''
characters: ${characters},
isLoading: ${isLoading},
currentPage: ${currentPage}
    ''';
  }
}
