// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MapPolicy _$MapPolicyFromJson(Map<String, dynamic> json) {
  return _MapPolicy.fromJson(json);
}

/// @nodoc
mixin _$MapPolicy {
  /// If true, show traffic layer (tiles/cost).
  bool get trafficEnabled => throw _privateConstructorUsedError;

  /// If false, pan/zoom gestures should be disabled in driving mode.
  bool get allowPanZoom => throw _privateConstructorUsedError;

  /// Suggested map refresh throttle while driving.
  /// Lower = smoother but higher tile usage.
  Duration get cameraUpdateInterval => throw _privateConstructorUsedError;

  /// Suggested traffic refresh cadence (if enabled).
  Duration get trafficRefreshInterval => throw _privateConstructorUsedError;

  /// If true, use simplified rendering/animations.
  bool get lowSpecRendering => throw _privateConstructorUsedError;

  /// Soft budget for map tile usage (for UI and future enforcement).
  int? get maxVectorTilesPer30Days => throw _privateConstructorUsedError;
  int? get maxTrafficTilesPer30Days => throw _privateConstructorUsedError;

  /// Serializes this MapPolicy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MapPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapPolicyCopyWith<MapPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPolicyCopyWith<$Res> {
  factory $MapPolicyCopyWith(MapPolicy value, $Res Function(MapPolicy) then) =
      _$MapPolicyCopyWithImpl<$Res, MapPolicy>;
  @useResult
  $Res call({
    bool trafficEnabled,
    bool allowPanZoom,
    Duration cameraUpdateInterval,
    Duration trafficRefreshInterval,
    bool lowSpecRendering,
    int? maxVectorTilesPer30Days,
    int? maxTrafficTilesPer30Days,
  });
}

/// @nodoc
class _$MapPolicyCopyWithImpl<$Res, $Val extends MapPolicy>
    implements $MapPolicyCopyWith<$Res> {
  _$MapPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trafficEnabled = null,
    Object? allowPanZoom = null,
    Object? cameraUpdateInterval = null,
    Object? trafficRefreshInterval = null,
    Object? lowSpecRendering = null,
    Object? maxVectorTilesPer30Days = freezed,
    Object? maxTrafficTilesPer30Days = freezed,
  }) {
    return _then(
      _value.copyWith(
            trafficEnabled: null == trafficEnabled
                ? _value.trafficEnabled
                : trafficEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowPanZoom: null == allowPanZoom
                ? _value.allowPanZoom
                : allowPanZoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            cameraUpdateInterval: null == cameraUpdateInterval
                ? _value.cameraUpdateInterval
                : cameraUpdateInterval // ignore: cast_nullable_to_non_nullable
                      as Duration,
            trafficRefreshInterval: null == trafficRefreshInterval
                ? _value.trafficRefreshInterval
                : trafficRefreshInterval // ignore: cast_nullable_to_non_nullable
                      as Duration,
            lowSpecRendering: null == lowSpecRendering
                ? _value.lowSpecRendering
                : lowSpecRendering // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxVectorTilesPer30Days: freezed == maxVectorTilesPer30Days
                ? _value.maxVectorTilesPer30Days
                : maxVectorTilesPer30Days // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxTrafficTilesPer30Days: freezed == maxTrafficTilesPer30Days
                ? _value.maxTrafficTilesPer30Days
                : maxTrafficTilesPer30Days // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MapPolicyImplCopyWith<$Res>
    implements $MapPolicyCopyWith<$Res> {
  factory _$$MapPolicyImplCopyWith(
    _$MapPolicyImpl value,
    $Res Function(_$MapPolicyImpl) then,
  ) = __$$MapPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool trafficEnabled,
    bool allowPanZoom,
    Duration cameraUpdateInterval,
    Duration trafficRefreshInterval,
    bool lowSpecRendering,
    int? maxVectorTilesPer30Days,
    int? maxTrafficTilesPer30Days,
  });
}

/// @nodoc
class __$$MapPolicyImplCopyWithImpl<$Res>
    extends _$MapPolicyCopyWithImpl<$Res, _$MapPolicyImpl>
    implements _$$MapPolicyImplCopyWith<$Res> {
  __$$MapPolicyImplCopyWithImpl(
    _$MapPolicyImpl _value,
    $Res Function(_$MapPolicyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MapPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trafficEnabled = null,
    Object? allowPanZoom = null,
    Object? cameraUpdateInterval = null,
    Object? trafficRefreshInterval = null,
    Object? lowSpecRendering = null,
    Object? maxVectorTilesPer30Days = freezed,
    Object? maxTrafficTilesPer30Days = freezed,
  }) {
    return _then(
      _$MapPolicyImpl(
        trafficEnabled: null == trafficEnabled
            ? _value.trafficEnabled
            : trafficEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowPanZoom: null == allowPanZoom
            ? _value.allowPanZoom
            : allowPanZoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        cameraUpdateInterval: null == cameraUpdateInterval
            ? _value.cameraUpdateInterval
            : cameraUpdateInterval // ignore: cast_nullable_to_non_nullable
                  as Duration,
        trafficRefreshInterval: null == trafficRefreshInterval
            ? _value.trafficRefreshInterval
            : trafficRefreshInterval // ignore: cast_nullable_to_non_nullable
                  as Duration,
        lowSpecRendering: null == lowSpecRendering
            ? _value.lowSpecRendering
            : lowSpecRendering // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxVectorTilesPer30Days: freezed == maxVectorTilesPer30Days
            ? _value.maxVectorTilesPer30Days
            : maxVectorTilesPer30Days // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxTrafficTilesPer30Days: freezed == maxTrafficTilesPer30Days
            ? _value.maxTrafficTilesPer30Days
            : maxTrafficTilesPer30Days // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MapPolicyImpl implements _MapPolicy {
  const _$MapPolicyImpl({
    required this.trafficEnabled,
    required this.allowPanZoom,
    required this.cameraUpdateInterval,
    required this.trafficRefreshInterval,
    required this.lowSpecRendering,
    this.maxVectorTilesPer30Days,
    this.maxTrafficTilesPer30Days,
  });

  factory _$MapPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapPolicyImplFromJson(json);

  /// If true, show traffic layer (tiles/cost).
  @override
  final bool trafficEnabled;

  /// If false, pan/zoom gestures should be disabled in driving mode.
  @override
  final bool allowPanZoom;

  /// Suggested map refresh throttle while driving.
  /// Lower = smoother but higher tile usage.
  @override
  final Duration cameraUpdateInterval;

  /// Suggested traffic refresh cadence (if enabled).
  @override
  final Duration trafficRefreshInterval;

  /// If true, use simplified rendering/animations.
  @override
  final bool lowSpecRendering;

  /// Soft budget for map tile usage (for UI and future enforcement).
  @override
  final int? maxVectorTilesPer30Days;
  @override
  final int? maxTrafficTilesPer30Days;

  @override
  String toString() {
    return 'MapPolicy(trafficEnabled: $trafficEnabled, allowPanZoom: $allowPanZoom, cameraUpdateInterval: $cameraUpdateInterval, trafficRefreshInterval: $trafficRefreshInterval, lowSpecRendering: $lowSpecRendering, maxVectorTilesPer30Days: $maxVectorTilesPer30Days, maxTrafficTilesPer30Days: $maxTrafficTilesPer30Days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapPolicyImpl &&
            (identical(other.trafficEnabled, trafficEnabled) ||
                other.trafficEnabled == trafficEnabled) &&
            (identical(other.allowPanZoom, allowPanZoom) ||
                other.allowPanZoom == allowPanZoom) &&
            (identical(other.cameraUpdateInterval, cameraUpdateInterval) ||
                other.cameraUpdateInterval == cameraUpdateInterval) &&
            (identical(other.trafficRefreshInterval, trafficRefreshInterval) ||
                other.trafficRefreshInterval == trafficRefreshInterval) &&
            (identical(other.lowSpecRendering, lowSpecRendering) ||
                other.lowSpecRendering == lowSpecRendering) &&
            (identical(
                  other.maxVectorTilesPer30Days,
                  maxVectorTilesPer30Days,
                ) ||
                other.maxVectorTilesPer30Days == maxVectorTilesPer30Days) &&
            (identical(
                  other.maxTrafficTilesPer30Days,
                  maxTrafficTilesPer30Days,
                ) ||
                other.maxTrafficTilesPer30Days == maxTrafficTilesPer30Days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    trafficEnabled,
    allowPanZoom,
    cameraUpdateInterval,
    trafficRefreshInterval,
    lowSpecRendering,
    maxVectorTilesPer30Days,
    maxTrafficTilesPer30Days,
  );

  /// Create a copy of MapPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapPolicyImplCopyWith<_$MapPolicyImpl> get copyWith =>
      __$$MapPolicyImplCopyWithImpl<_$MapPolicyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapPolicyImplToJson(this);
  }
}

abstract class _MapPolicy implements MapPolicy {
  const factory _MapPolicy({
    required final bool trafficEnabled,
    required final bool allowPanZoom,
    required final Duration cameraUpdateInterval,
    required final Duration trafficRefreshInterval,
    required final bool lowSpecRendering,
    final int? maxVectorTilesPer30Days,
    final int? maxTrafficTilesPer30Days,
  }) = _$MapPolicyImpl;

  factory _MapPolicy.fromJson(Map<String, dynamic> json) =
      _$MapPolicyImpl.fromJson;

  /// If true, show traffic layer (tiles/cost).
  @override
  bool get trafficEnabled;

  /// If false, pan/zoom gestures should be disabled in driving mode.
  @override
  bool get allowPanZoom;

  /// Suggested map refresh throttle while driving.
  /// Lower = smoother but higher tile usage.
  @override
  Duration get cameraUpdateInterval;

  /// Suggested traffic refresh cadence (if enabled).
  @override
  Duration get trafficRefreshInterval;

  /// If true, use simplified rendering/animations.
  @override
  bool get lowSpecRendering;

  /// Soft budget for map tile usage (for UI and future enforcement).
  @override
  int? get maxVectorTilesPer30Days;
  @override
  int? get maxTrafficTilesPer30Days;

  /// Create a copy of MapPolicy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapPolicyImplCopyWith<_$MapPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
