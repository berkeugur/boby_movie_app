// lib/features/onboarding/data/repositories/movie_repository_impl.dart

import 'package:boby_movie_app/features/onboarding/data/datasources/genres_remote_data_source.dart';
import 'package:boby_movie_app/features/onboarding/domain/entities/genre_entity.dart';
import 'package:boby_movie_app/features/onboarding/domain/entities/genres_response_entity.dart';
import 'package:boby_movie_app/features/onboarding/domain/repositories/genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresRemoteDataSource remoteDataSource;

  GenresRepositoryImpl(this.remoteDataSource);

  @override
  Future<GenresResponseEntity> getGenres() async {
    final response = await remoteDataSource.getGenres();
    final genres = response.genres.map((model) => GenreEntity(id: model.id, name: model.name, imageUrl: model.imageUrl)).toList();

    return GenresResponseEntity(genres: genres);
  }
}
