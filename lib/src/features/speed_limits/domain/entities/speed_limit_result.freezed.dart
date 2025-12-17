// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speed_limit_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SpeedLimitResult _$SpeedLimitResultFromJson(Map<String, dynamic> json) {
  return _SpeedLimitResult.fromJson(json);
}

/// @nodoc
mixin _$SpeedLimitResult {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  int? get maxKph => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  DateTime? get fetchedAt => throw _privateConstructorUsedError;

  /// Serializes this SpeedLimitResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpeedLimitResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeedLimitResultCopyWith<SpeedLimitResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeedLimitResultCopyWith<$Res> {
  factory $SpeedLimitResultCopyWith(
    SpeedLimitResult value,
    $Res Function(SpeedLimitResult) then,
  ) = _$SpeedLimitResultCopyWithImpl<$Res, SpeedLimitResult>;
  @useResult
  $Res call({
    double lat,
    double lng,
    int? maxKph,
    String? source,
    DateTime? fetchedAt,
  });
}

/// @nodoc
class _$SpeedLimitResultCopyWithImpl<$Res, $Val extends SpeedLimitResult>
    implements $SpeedLimitResultCopyWith<$Res> {
  _$SpeedLimitResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeedLimitResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? maxKph = freezed,
    Object? source = freezed,
    Object? fetchedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lng: null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double,
            maxKph: freezed == maxKph
                ? _value.maxKph
                : maxKph // ignore: cast_nullable_to_non_nullable
                      as int?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            fetchedAt: freezed == fetchedAt
                ? _value.fetchedAt
                : fetchedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpeedLimitResultImplCopyWith<$Res>
    implements $SpeedLimitResultCopyWith<$Res> {
  factory _$$SpeedLimitResultImplCopyWith(
    _$SpeedLimitResultImpl value,
    $Res Function(_$SpeedLimitResultImpl) then,
  ) = __$$SpeedLimitResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double lat,
    double lng,
    int? maxKph,
    String? source,
    DateTime? fetchedAt,
  });
}

/// @nodoc
class __$$SpeedLimitResultImplCopyWithImpl<$Res>
    extends _$SpeedLimitResultCopyWithImpl<$Res, _$SpeedLimitResultImpl>
    implements _$$SpeedLimitResultImplCopyWith<$Res> {
  __$$SpeedLimitResultImplCopyWithImpl(
    _$SpeedLimitResultImpl _value,
    $Res Function(_$SpeedLimitResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeedLimitResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? maxKph = freezed,
    Object? source = freezed,
    Object? fetchedAt = freezed,
  }) {
    return _then(
      _$SpeedLimitResultImpl(
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lng: null == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double,
        maxKph: freezed == maxKph
            ? _value.maxKph
            : maxKph // ignore: cast_nullable_to_non_nullable
                  as int?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        fetchedAt: freezed == fetchedAt
            ? _value.fetchedAt
            : fetchedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpeedLimitResultImpl implements _SpeedLimitResult {
  const _$SpeedLimitResultImpl({
    required this.lat,
    required this.lng,
    this.maxKph,
    this.source,
    this.fetchedAt,
  });

  factory _$SpeedLimitResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeedLimitResultImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final int? maxKph;
  @override
  final String? source;
  @override
  final DateTime? fetchedAt;

  @override
  String toString() {
    return 'SpeedLimitResult(lat: $lat, lng: $lng, maxKph: $maxKph, source: $source, fetchedAt: $fetchedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeedLimitResultImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.maxKph, maxKph) || other.maxKph == maxKph) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.fetchedAt, fetchedAt) ||
                other.fetchedAt == fetchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lng, maxKph, source, fetchedAt);

  /// Create a copy of SpeedLimitResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeedLimitResultImplCopyWith<_$SpeedLimitResultImpl> get copyWith =>
      __$$SpeedLimitResultImplCopyWithImpl<_$SpeedLimitResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeedLimitResultImplToJson(this);
  }
}

abstract class _SpeedLimitResult implements SpeedLimitResult {
  const factory _SpeedLimitResult({
    required final double lat,
    required final double lng,
    final int? maxKph,
    final String? source,
    final DateTime? fetchedAt,
  }) = _$SpeedLimitResultImpl;

  factory _SpeedLimitResult.fromJson(Map<String, dynamic> json) =
      _$SpeedLimitResultImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  int? get maxKph;
  @override
  String? get source;
  @override
  DateTime? get fetchedAt;

  /// Create a copy of SpeedLimitResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeedLimitResultImplCopyWith<_$SpeedLimitResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
