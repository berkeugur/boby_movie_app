// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenresResponseModelImpl _$$GenresResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GenresResponseModelImpl(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenresResponseModelImplToJson(
        _$GenresResponseModelImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
