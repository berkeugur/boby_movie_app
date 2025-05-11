import 'package:boby_movie_app/features/onboarding/data/repositories/movie_repository_impl.dart';
import 'package:boby_movie_app/features/onboarding/domain/entities/movie_entity.dart';
import 'package:mobx/mobx.dart';

part 'movie_store.g.dart';

class MovieStore = MovieStoreBase with _$MovieStore;

abstract class MovieStoreBase with Store {
  final MovieRepositoryImpl movieRepository;

  MovieStoreBase(this.movieRepository);

  @observable
  ObservableList<MovieEntity> movies = ObservableList<MovieEntity>();

  @observable
  ObservableList<MovieEntity> favoriteMovies = ObservableList<MovieEntity>();

  @action
  void toggleFavoriteMovies(MovieEntity movie) {
    if (!favoriteMovies.contains(movie)) {
      favoriteMovies.add(movie);
    } else {
      favoriteMovies.remove(movie);
    }
    movies = ObservableList.of(movies.map((m) => m));
  }

  bool isMovieSelected(MovieEntity movie) {
    return favoriteMovies.contains(movie);
  }

  @computed
  int get numOfselectedMovie => favoriteMovies.length;

  @observable
  int currentPage = 1;

  @observable
  int totalPages = 1;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchMovies({bool isRefresh = false}) async {
    if (isLoading) return;
    if (!isRefresh && currentPage > totalPages) return;

    try {
      isLoading = true;
      final response = await movieRepository.getMovies(page: currentPage);
      if (isRefresh) {
        movies = ObservableList.of(response.results);
        currentPage = 2;
      } else {
        movies.addAll(response.results);
        currentPage++;
      }
      totalPages = response.totalPages;
    } catch (e) {
      // Error handling
    } finally {
      isLoading = false;
    }
  }

  @action
  void refresh() {
    currentPage = 1;
    totalPages = 1;
    fetchMovies(isRefresh: true);
  }
}
