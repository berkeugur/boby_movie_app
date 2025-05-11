import 'package:boby_movie_app/core/network/dio_client.dart';
import 'package:boby_movie_app/features/onboarding/data/datasources/genres_remote_data_source.dart';
import 'package:boby_movie_app/features/onboarding/data/datasources/movie_remote_data_source.dart';
import 'package:boby_movie_app/features/onboarding/data/repositories/genres_reposityory_impl.dart';
import 'package:boby_movie_app/features/onboarding/data/repositories/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // Registering DioClient
  getIt.registerLazySingleton<DioClient>(() => DioClient(Dio()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getIt<DioClient>()));
  getIt.registerLazySingleton<GenresRemoteDataSource>(() => GenresRemoteDataSourceImpl(getIt<DioClient>()));

  // Repositories
  getIt.registerLazySingleton<MovieRepositoryImpl>(() => MovieRepositoryImpl(getIt<MovieRemoteDataSource>()));
  getIt.registerLazySingleton<GenresRepositoryImpl>(() => GenresRepositoryImpl(getIt<GenresRemoteDataSource>()));
}
