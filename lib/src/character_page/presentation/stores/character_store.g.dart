// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStoreBase, Store {
  Computed<bool>? _$isLastPageComputed;

  @override
  bool get isLastPage =>
      (_$isLastPageComputed ??= Computed<bool>(() => super.isLastPage,
              name: '_CharacterStoreBase.isLastPage'))
          .value;

  late final _$stateAtom =
      Atom(name: '_CharacterStoreBase.state', context: context);

  @override
  CharacterState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CharacterState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterStoreBase.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters(int page) {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters(page));
  }

  late final _$loadMoreCharactersAsyncAction =
      AsyncAction('_CharacterStoreBase.loadMoreCharacters', context: context);

  @override
  Future<void> loadMoreCharacters() {
    return _$loadMoreCharactersAsyncAction
        .run(() => super.loadMoreCharacters());
  }

  late final _$refreshCharactersAsyncAction =
      AsyncAction('_CharacterStoreBase.refreshCharacters', context: context);

  @override
  Future<void> refreshCharacters() {
    return _$refreshCharactersAsyncAction.run(() => super.refreshCharacters());
  }

  late final _$updateDataInBackgroundAsyncAction = AsyncAction(
      '_CharacterStoreBase.updateDataInBackground',
      context: context);

  @override
  Future<void> updateDataInBackground() {
    return _$updateDataInBackgroundAsyncAction
        .run(() => super.updateDataInBackground());
  }

  @override
  String toString() {
    return '''
state: ${state},
isLastPage: ${isLastPage}
    ''';
  }
}
