// lib/features/onboarding/domain/entities/movie_entity.dart

class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });
}
