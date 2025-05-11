// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GenresStore on GenresStoreBase, Store {
  Computed<int>? _$numOfselectedGenreComputed;

  @override
  int get numOfselectedGenre => (_$numOfselectedGenreComputed ??= Computed<int>(
          () => super.numOfselectedGenre,
          name: 'GenresStoreBase.numOfselectedGenre'))
      .value;

  late final _$genresAtom =
      Atom(name: 'GenresStoreBase.genres', context: context);

  @override
  ObservableList<GenreEntity> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<GenreEntity> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  late final _$favoriteGenresAtom =
      Atom(name: 'GenresStoreBase.favoriteGenres', context: context);

  @override
  ObservableList<GenreEntity> get favoriteGenres {
    _$favoriteGenresAtom.reportRead();
    return super.favoriteGenres;
  }

  @override
  set favoriteGenres(ObservableList<GenreEntity> value) {
    _$favoriteGenresAtom.reportWrite(value, super.favoriteGenres, () {
      super.favoriteGenres = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'GenresStoreBase.isLoading', context: context);

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

  late final _$fetchGenresAsyncAction =
      AsyncAction('GenresStoreBase.fetchGenres', context: context);

  @override
  Future<void> fetchGenres({bool isRefresh = false}) {
    return _$fetchGenresAsyncAction
        .run(() => super.fetchGenres(isRefresh: isRefresh));
  }

  late final _$GenresStoreBaseActionController =
      ActionController(name: 'GenresStoreBase', context: context);

  @override
  void toggleFavoriteGenres(GenreEntity genre) {
    final _$actionInfo = _$GenresStoreBaseActionController.startAction(
        name: 'GenresStoreBase.toggleFavoriteGenres');
    try {
      return super.toggleFavoriteGenres(genre);
    } finally {
      _$GenresStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isGenresSelected(GenreEntity genre) {
    final _$actionInfo = _$GenresStoreBaseActionController.startAction(
        name: 'GenresStoreBase.isGenresSelected');
    try {
      return super.isGenresSelected(genre);
    } finally {
      _$GenresStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$GenresStoreBaseActionController.startAction(
        name: 'GenresStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$GenresStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
genres: ${genres},
favoriteGenres: ${favoriteGenres},
isLoading: ${isLoading},
numOfselectedGenre: ${numOfselectedGenre}
    ''';
  }
}
