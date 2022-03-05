// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$tvShowsAtom = Atom(name: 'HomeStoreBase.tvShows');

  @override
  dynamic get tvShows {
    _$tvShowsAtom.reportRead();
    return super.tvShows;
  }

  @override
  set tvShows(dynamic value) {
    _$tvShowsAtom.reportWrite(value, super.tvShows, () {
      super.tvShows = value;
    });
  }

  final _$pageCounterAtom = Atom(name: 'HomeStoreBase.pageCounter');

  @override
  int get pageCounter {
    _$pageCounterAtom.reportRead();
    return super.pageCounter;
  }

  @override
  set pageCounter(int value) {
    _$pageCounterAtom.reportWrite(value, super.pageCounter, () {
      super.pageCounter = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStoreBase.isLoading');

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

  final _$getPageAsyncAction = AsyncAction('HomeStoreBase.getPage');

  @override
  Future<void> getPage() {
    return _$getPageAsyncAction.run(() => super.getPage());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic movePage(bool up) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.movePage');
    try {
      return super.movePage(up);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool b) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoading');
    try {
      return super.setLoading(b);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tvShows: ${tvShows},
pageCounter: ${pageCounter},
isLoading: ${isLoading}
    ''';
  }
}
