import 'package:boby_movie_app/features/onboarding/domain/entities/genre_entity.dart';
import 'package:boby_movie_app/features/onboarding/domain/repositories/genres_repository.dart';
import 'package:mobx/mobx.dart';

part 'genres_store.g.dart';

class GenresStore = GenresStoreBase with _$GenresStore;

abstract class GenresStoreBase with Store {
  final GenresRepository genresRepository;

  GenresStoreBase(this.genresRepository);

  @observable
  ObservableList<GenreEntity> genres = ObservableList<GenreEntity>();

  @observable
  ObservableList<GenreEntity> favoriteGenres = ObservableList<GenreEntity>();

  @action
  void toggleFavoriteGenres(GenreEntity genre) {
    if (!favoriteGenres.contains(genre)) {
      favoriteGenres.add(genre);
    } else {
      favoriteGenres.remove(genre);
    }
    genres = ObservableList.of(genres.map((g) => g));
  }

  @action
  bool isGenresSelected(GenreEntity genre) => favoriteGenres.contains(genre);

  @computed
  int get numOfselectedGenre => favoriteGenres.length;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchGenres({bool isRefresh = false}) async {
    if (isLoading) return;
    if (!isRefresh && genres.isNotEmpty) return;

    try {
      isLoading = true;
      final response = await genresRepository.getGenres();
      genres = ObservableList.of(response.genres);
    } catch (e) {
      // Error handling
    } finally {
      isLoading = false;
    }
  }

  @action
  void refresh() {
    genres.clear();
    fetchGenres(isRefresh: true);
  }
}
