// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/store.dart';

abstract class StoreNotifier<T> implements Store<T> {
  final _changeNotifier = ChangeNotifier();
  T _state;
  StoreNotifier(this._state);

  @override
  T get state => _state;

  @override
  void dispatch(T state) {
    _state = state;
    _changeNotifier.notifyListeners();
  }

  @override
  StoreDispose connect(void Function(T) listener) {
    void _listener() => listener(state);

    _changeNotifier.addListener(_listener);

    return () => _changeNotifier.removeListener(_listener);
  }

  @override
  void dispose() {
    _changeNotifier.dispose();
  }
}
