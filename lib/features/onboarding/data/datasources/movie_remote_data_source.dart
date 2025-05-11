// lib/features/onboarding/data/datasources/movie_remote_data_source.dart

import 'package:boby_movie_app/core/network/dio_client.dart';
import 'package:boby_movie_app/features/onboarding/data/models/movie_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponseModel> getMovies({required int page});
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioClient dioClient;

  MovieRemoteDataSourceImpl(this.dioClient);

  @override
  Future<MovieResponseModel> getMovies({required int page}) async {
    final response = await dioClient.get(
      "/discover/movie",
      queryParameters: {'page': page, 'language': 'en-US', 'include_adult': false, 'include_video': false, 'sort_by': 'popularity.desc'},
    );

    final MovieResponseModel movies = MovieResponseModel.fromJson(response.data);

    return movies;
  }
}
