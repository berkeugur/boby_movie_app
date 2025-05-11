import 'package:boby_movie_app/features/onboarding/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response_model.freezed.dart';
part 'movie_response_model.g.dart';

@freezed
sealed class MovieResponseModel with _$MovieResponseModel {
  const factory MovieResponseModel({
    required int page,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
    required List<MovieModel> results,
  }) = _MovieResponseModel;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);
}
