import 'package:boby_movie_app/features/onboarding/domain/entities/genre_entity.dart';

class GenresResponseEntity {
  final List<GenreEntity> genres;

  const GenresResponseEntity({required this.genres});
}
