// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterState on _CharacterStateBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CharacterStateBase.isLoading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_CharacterStateBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: '_CharacterStateBase.characters', context: context);

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

  late final _$_CharacterStateBaseActionController =
      ActionController(name: '_CharacterStateBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CharacterStateBaseActionController.startAction(
        name: '_CharacterStateBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CharacterStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_CharacterStateBaseActionController.startAction(
        name: '_CharacterStateBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_CharacterStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharacters(List<Character> newCharacters) {
    final _$actionInfo = _$_CharacterStateBaseActionController.startAction(
        name: '_CharacterStateBase.setCharacters');
    try {
      return super.setCharacters(newCharacters);
    } finally {
      _$_CharacterStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCharacters(List<Character> newCharacters) {
    final _$actionInfo = _$_CharacterStateBaseActionController.startAction(
        name: '_CharacterStateBase.addCharacters');
    try {
      return super.addCharacters(newCharacters);
    } finally {
      _$_CharacterStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCharacters() {
    final _$actionInfo = _$_CharacterStateBaseActionController.startAction(
        name: '_CharacterStateBase.clearCharacters');
    try {
      return super.clearCharacters();
    } finally {
      _$_CharacterStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
characters: ${characters}
    ''';
  }
}
