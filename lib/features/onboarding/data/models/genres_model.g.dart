// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenresModelImpl _$$GenresModelImplFromJson(Map<String, dynamic> json) =>
    _$GenresModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String? ??
          "https://images.ladbible.com/resize?type=webp&quality=70&width=3840&fit=contain&gravity=auto&url=https://images.ladbiblegroup.com/v3/assets/bltcd74acc1d0a99f3a/blt44d7a78c1e58335a/67a22ea6adbb8b041e86e6a1/Screenshot_2025-02-04_at_15.13.14.png",
    );

Map<String, dynamic> _$$GenresModelImplToJson(_$GenresModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
