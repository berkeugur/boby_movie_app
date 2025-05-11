// lib/features/onboarding/domain/entities/movie_pagination_entity.dart

import 'movie_entity.dart';

class MoviePaginationEntity {
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;
  final int page;

  MoviePaginationEntity({required this.results, required this.totalPages, required this.totalResults, required this.page});
}
