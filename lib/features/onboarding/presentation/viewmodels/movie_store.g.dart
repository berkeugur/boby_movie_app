// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on MovieStoreBase, Store {
  Computed<int>? _$numOfselectedMovieComputed;

  @override
  int get numOfselectedMovie => (_$numOfselectedMovieComputed ??= Computed<int>(
          () => super.numOfselectedMovie,
          name: 'MovieStoreBase.numOfselectedMovie'))
      .value;

  late final _$moviesAtom =
      Atom(name: 'MovieStoreBase.movies', context: context);

  @override
  ObservableList<MovieEntity> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MovieEntity> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$favoriteMoviesAtom =
      Atom(name: 'MovieStoreBase.favoriteMovies', context: context);

  @override
  ObservableList<MovieEntity> get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(ObservableList<MovieEntity> value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'MovieStoreBase.currentPage', context: context);

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

  late final _$totalPagesAtom =
      Atom(name: 'MovieStoreBase.totalPages', context: context);

  @override
  int get totalPages {
    _$totalPagesAtom.reportRead();
    return super.totalPages;
  }

  @override
  set totalPages(int value) {
    _$totalPagesAtom.reportWrite(value, super.totalPages, () {
      super.totalPages = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'MovieStoreBase.isLoading', context: context);

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

  late final _$fetchMoviesAsyncAction =
      AsyncAction('MovieStoreBase.fetchMovies', context: context);

  @override
  Future<void> fetchMovies({bool isRefresh = false}) {
    return _$fetchMoviesAsyncAction
        .run(() => super.fetchMovies(isRefresh: isRefresh));
  }

  late final _$MovieStoreBaseActionController =
      ActionController(name: 'MovieStoreBase', context: context);

  @override
  void toggleFavoriteMovies(MovieEntity movie) {
    final _$actionInfo = _$MovieStoreBaseActionController.startAction(
        name: 'MovieStoreBase.toggleFavoriteMovies');
    try {
      return super.toggleFavoriteMovies(movie);
    } finally {
      _$MovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$MovieStoreBaseActionController.startAction(
        name: 'MovieStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$MovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
favoriteMovies: ${favoriteMovies},
currentPage: ${currentPage},
totalPages: ${totalPages},
isLoading: ${isLoading},
numOfselectedMovie: ${numOfselectedMovie}
    ''';
  }
}
