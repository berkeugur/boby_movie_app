// lib/features/onboarding/data/datasources/movie_remote_data_source.dart

import 'package:boby_movie_app/core/network/dio_client.dart';
import 'package:boby_movie_app/features/onboarding/data/models/genres_response_model.dart';

abstract class GenresRemoteDataSource {
  Future<GenresResponseModel> getGenres();
}

class GenresRemoteDataSourceImpl implements GenresRemoteDataSource {
  final DioClient dioClient;

  GenresRemoteDataSourceImpl(this.dioClient);

  @override
  Future<GenresResponseModel> getGenres() async {
    final response = await dioClient.get("/genre/movie/list", queryParameters: {'language': 'en-US'});

    final GenresResponseModel genres = GenresResponseModel.fromJson(response.data);

    return genres;
  }
}
