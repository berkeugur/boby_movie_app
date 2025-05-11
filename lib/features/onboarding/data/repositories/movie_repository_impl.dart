// lib/features/onboarding/data/repositories/movie_repository_impl.dart

import 'package:boby_movie_app/features/onboarding/data/datasources/movie_remote_data_source.dart';
import 'package:boby_movie_app/features/onboarding/domain/entities/movie_entity.dart';
import 'package:boby_movie_app/features/onboarding/domain/entities/movie_pagination_entity.dart';
import 'package:boby_movie_app/features/onboarding/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<MoviePaginationEntity> getMovies({required int page}) async {
    final response = await remoteDataSource.getMovies(page: page);
    final movies =
        response.results
            .map((model) => MovieEntity(id: model.id, title: model.title, overview: model.overview, posterPath: model.posterPath))
            .toList();

    return MoviePaginationEntity(results: movies, totalPages: response.totalPages, totalResults: response.totalResults, page: response.page);
  }
}
