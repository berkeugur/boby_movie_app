import 'package:boby_movie_app/features/onboarding/data/models/genres_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_response_model.freezed.dart';
part 'genres_response_model.g.dart';

@freezed
sealed class GenresResponseModel with _$GenresResponseModel {
  const factory GenresResponseModel({required List<GenresModel> genres}) = _GenresResponseModel;

  factory GenresResponseModel.fromJson(Map<String, dynamic> json) => _$GenresResponseModelFromJson(json);
}
