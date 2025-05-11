// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genres_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenresResponseModel _$GenresResponseModelFromJson(Map<String, dynamic> json) {
  return _GenresResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GenresResponseModel {
  List<GenresModel> get genres => throw _privateConstructorUsedError;

  /// Serializes this GenresResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenresResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenresResponseModelCopyWith<GenresResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresResponseModelCopyWith<$Res> {
  factory $GenresResponseModelCopyWith(
          GenresResponseModel value, $Res Function(GenresResponseModel) then) =
      _$GenresResponseModelCopyWithImpl<$Res, GenresResponseModel>;
  @useResult
  $Res call({List<GenresModel> genres});
}

/// @nodoc
class _$GenresResponseModelCopyWithImpl<$Res, $Val extends GenresResponseModel>
    implements $GenresResponseModelCopyWith<$Res> {
  _$GenresResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenresResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenresModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenresResponseModelImplCopyWith<$Res>
    implements $GenresResponseModelCopyWith<$Res> {
  factory _$$GenresResponseModelImplCopyWith(_$GenresResponseModelImpl value,
          $Res Function(_$GenresResponseModelImpl) then) =
      __$$GenresResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GenresModel> genres});
}

/// @nodoc
class __$$GenresResponseModelImplCopyWithImpl<$Res>
    extends _$GenresResponseModelCopyWithImpl<$Res, _$GenresResponseModelImpl>
    implements _$$GenresResponseModelImplCopyWith<$Res> {
  __$$GenresResponseModelImplCopyWithImpl(_$GenresResponseModelImpl _value,
      $Res Function(_$GenresResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenresResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$GenresResponseModelImpl(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenresModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenresResponseModelImpl implements _GenresResponseModel {
  const _$GenresResponseModelImpl({required final List<GenresModel> genres})
      : _genres = genres;

  factory _$GenresResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenresResponseModelImplFromJson(json);

  final List<GenresModel> _genres;
  @override
  List<GenresModel> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'GenresResponseModel(genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenresResponseModelImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  /// Create a copy of GenresResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenresResponseModelImplCopyWith<_$GenresResponseModelImpl> get copyWith =>
      __$$GenresResponseModelImplCopyWithImpl<_$GenresResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenresResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GenresResponseModel implements GenresResponseModel {
  const factory _GenresResponseModel(
      {required final List<GenresModel> genres}) = _$GenresResponseModelImpl;

  factory _GenresResponseModel.fromJson(Map<String, dynamic> json) =
      _$GenresResponseModelImpl.fromJson;

  @override
  List<GenresModel> get genres;

  /// Create a copy of GenresResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenresResponseModelImplCopyWith<_$GenresResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
