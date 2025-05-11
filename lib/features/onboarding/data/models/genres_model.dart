import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_model.freezed.dart';
part 'genres_model.g.dart';

@freezed
sealed class GenresModel with _$GenresModel {
  const factory GenresModel({
    required int id,
    required String name,
    @Default(
      "https://images.ladbible.com/resize?type=webp&quality=70&width=3840&fit=contain&gravity=auto&url=https://images.ladbiblegroup.com/v3/assets/bltcd74acc1d0a99f3a/blt44d7a78c1e58335a/67a22ea6adbb8b041e86e6a1/Screenshot_2025-02-04_at_15.13.14.png",
    )
    String imageUrl,
  }) = _GenresModel;

  factory GenresModel.fromJson(Map<String, dynamic> json) => _$GenresModelFromJson(json);
}
