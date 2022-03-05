// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TvShowStore on TvShowStoreBase, Store {
  final _$tvShowAtom = Atom(name: 'TvShowStoreBase.tvShow');

  @override
  TvShow? get tvShow {
    _$tvShowAtom.reportRead();
    return super.tvShow;
  }

  @override
  set tvShow(TvShow? value) {
    _$tvShowAtom.reportWrite(value, super.tvShow, () {
      super.tvShow = value;
    });
  }

  final _$episodeListAtom = Atom(name: 'TvShowStoreBase.episodeList');

  @override
  dynamic get episodeList {
    _$episodeListAtom.reportRead();
    return super.episodeList;
  }

  @override
  set episodeList(dynamic value) {
    _$episodeListAtom.reportWrite(value, super.episodeList, () {
      super.episodeList = value;
    });
  }

  final _$seasonListAtom = Atom(name: 'TvShowStoreBase.seasonList');

  @override
  dynamic get seasonList {
    _$seasonListAtom.reportRead();
    return super.seasonList;
  }

  @override
  set seasonList(dynamic value) {
    _$seasonListAtom.reportWrite(value, super.seasonList, () {
      super.seasonList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'TvShowStoreBase.isLoading');

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

  final _$getPageAsyncAction = AsyncAction('TvShowStoreBase.getPage');

  @override
  Future<void> getPage() {
    return _$getPageAsyncAction.run(() => super.getPage());
  }

  final _$TvShowStoreBaseActionController =
      ActionController(name: 'TvShowStoreBase');

  @override
  dynamic setTvShow(TvShow m) {
    final _$actionInfo = _$TvShowStoreBaseActionController.startAction(
        name: 'TvShowStoreBase.setTvShow');
    try {
      return super.setTvShow(m);
    } finally {
      _$TvShowStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool b) {
    final _$actionInfo = _$TvShowStoreBaseActionController.startAction(
        name: 'TvShowStoreBase.setLoading');
    try {
      return super.setLoading(b);
    } finally {
      _$TvShowStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tvShow: ${tvShow},
episodeList: ${episodeList},
seasonList: ${seasonList},
isLoading: ${isLoading}
    ''';
  }
}
