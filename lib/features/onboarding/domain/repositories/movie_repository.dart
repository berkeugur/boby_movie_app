// lib/features/onboarding/domain/repositories/movie_repository.dart

import 'package:boby_movie_app/features/onboarding/domain/entities/movie_pagination_entity.dart';

abstract class MovieRepository {
  Future<MoviePaginationEntity> getMovies({required int page});
}
