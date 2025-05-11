// lib/features/onboarding/domain/repositories/movie_repository.dart

import 'package:boby_movie_app/features/onboarding/domain/entities/genres_response_entity.dart';

abstract class GenresRepository {
  Future<GenresResponseEntity> getGenres();
}
