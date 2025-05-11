// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieResponseModel _$MovieResponseModelFromJson(Map<String, dynamic> json) {
  return _MovieResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MovieResponseModel {
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "total_results")
  int get totalResults => throw _privateConstructorUsedError;
  List<MovieModel> get results => throw _privateConstructorUsedError;

  /// Serializes this MovieResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieResponseModelCopyWith<MovieResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResponseModelCopyWith<$Res> {
  factory $MovieResponseModelCopyWith(
          MovieResponseModel value, $Res Function(MovieResponseModel) then) =
      _$MovieResponseModelCopyWithImpl<$Res, MovieResponseModel>;
  @useResult
  $Res call(
      {int page,
      @JsonKey(name: "total_pages") int totalPages,
      @JsonKey(name: "total_results") int totalResults,
      List<MovieModel> results});
}

/// @nodoc
class _$MovieResponseModelCopyWithImpl<$Res, $Val extends MovieResponseModel>
    implements $MovieResponseModelCopyWith<$Res> {
  _$MovieResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieResponseModelImplCopyWith<$Res>
    implements $MovieResponseModelCopyWith<$Res> {
  factory _$$MovieResponseModelImplCopyWith(_$MovieResponseModelImpl value,
          $Res Function(_$MovieResponseModelImpl) then) =
      __$$MovieResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      @JsonKey(name: "total_pages") int totalPages,
      @JsonKey(name: "total_results") int totalResults,
      List<MovieModel> results});
}

/// @nodoc
class __$$MovieResponseModelImplCopyWithImpl<$Res>
    extends _$MovieResponseModelCopyWithImpl<$Res, _$MovieResponseModelImpl>
    implements _$$MovieResponseModelImplCopyWith<$Res> {
  __$$MovieResponseModelImplCopyWithImpl(_$MovieResponseModelImpl _value,
      $Res Function(_$MovieResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? results = null,
  }) {
    return _then(_$MovieResponseModelImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieResponseModelImpl implements _MovieResponseModel {
  const _$MovieResponseModelImpl(
      {required this.page,
      @JsonKey(name: "total_pages") required this.totalPages,
      @JsonKey(name: "total_results") required this.totalResults,
      required final List<MovieModel> results})
      : _results = results;

  factory _$MovieResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieResponseModelImplFromJson(json);

  @override
  final int page;
  @override
  @JsonKey(name: "total_pages")
  final int totalPages;
  @override
  @JsonKey(name: "total_results")
  final int totalResults;
  final List<MovieModel> _results;
  @override
  List<MovieModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MovieResponseModel(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieResponseModelImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalPages, totalResults,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of MovieResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieResponseModelImplCopyWith<_$MovieResponseModelImpl> get copyWith =>
      __$$MovieResponseModelImplCopyWithImpl<_$MovieResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MovieResponseModel implements MovieResponseModel {
  const factory _MovieResponseModel(
      {required final int page,
      @JsonKey(name: "total_pages") required final int totalPages,
      @JsonKey(name: "total_results") required final int totalResults,
      required final List<MovieModel> results}) = _$MovieResponseModelImpl;

  factory _MovieResponseModel.fromJson(Map<String, dynamic> json) =
      _$MovieResponseModelImpl.fromJson;

  @override
  int get page;
  @override
  @JsonKey(name: "total_pages")
  int get totalPages;
  @override
  @JsonKey(name: "total_results")
  int get totalResults;
  @override
  List<MovieModel> get results;

  /// Create a copy of MovieResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieResponseModelImplCopyWith<_$MovieResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
