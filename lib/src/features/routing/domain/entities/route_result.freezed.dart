// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RouteResult _$RouteResultFromJson(Map<String, dynamic> json) {
  return _RouteResult.fromJson(json);
}

/// @nodoc
mixin _$RouteResult {
  String get routeId => throw _privateConstructorUsedError;
  String get polyline => throw _privateConstructorUsedError;
  List<String> get maneuvers => throw _privateConstructorUsedError;
  int? get distanceMeters => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  DateTime? get computedAt => throw _privateConstructorUsedError;

  /// Serializes this RouteResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteResultCopyWith<RouteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResultCopyWith<$Res> {
  factory $RouteResultCopyWith(
    RouteResult value,
    $Res Function(RouteResult) then,
  ) = _$RouteResultCopyWithImpl<$Res, RouteResult>;
  @useResult
  $Res call({
    String routeId,
    String polyline,
    List<String> maneuvers,
    int? distanceMeters,
    int? durationSeconds,
    DateTime? computedAt,
  });
}

/// @nodoc
class _$RouteResultCopyWithImpl<$Res, $Val extends RouteResult>
    implements $RouteResultCopyWith<$Res> {
  _$RouteResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? polyline = null,
    Object? maneuvers = null,
    Object? distanceMeters = freezed,
    Object? durationSeconds = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            routeId: null == routeId
                ? _value.routeId
                : routeId // ignore: cast_nullable_to_non_nullable
                      as String,
            polyline: null == polyline
                ? _value.polyline
                : polyline // ignore: cast_nullable_to_non_nullable
                      as String,
            maneuvers: null == maneuvers
                ? _value.maneuvers
                : maneuvers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            distanceMeters: freezed == distanceMeters
                ? _value.distanceMeters
                : distanceMeters // ignore: cast_nullable_to_non_nullable
                      as int?,
            durationSeconds: freezed == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            computedAt: freezed == computedAt
                ? _value.computedAt
                : computedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteResultImplCopyWith<$Res>
    implements $RouteResultCopyWith<$Res> {
  factory _$$RouteResultImplCopyWith(
    _$RouteResultImpl value,
    $Res Function(_$RouteResultImpl) then,
  ) = __$$RouteResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String routeId,
    String polyline,
    List<String> maneuvers,
    int? distanceMeters,
    int? durationSeconds,
    DateTime? computedAt,
  });
}

/// @nodoc
class __$$RouteResultImplCopyWithImpl<$Res>
    extends _$RouteResultCopyWithImpl<$Res, _$RouteResultImpl>
    implements _$$RouteResultImplCopyWith<$Res> {
  __$$RouteResultImplCopyWithImpl(
    _$RouteResultImpl _value,
    $Res Function(_$RouteResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? polyline = null,
    Object? maneuvers = null,
    Object? distanceMeters = freezed,
    Object? durationSeconds = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _$RouteResultImpl(
        routeId: null == routeId
            ? _value.routeId
            : routeId // ignore: cast_nullable_to_non_nullable
                  as String,
        polyline: null == polyline
            ? _value.polyline
            : polyline // ignore: cast_nullable_to_non_nullable
                  as String,
        maneuvers: null == maneuvers
            ? _value._maneuvers
            : maneuvers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        distanceMeters: freezed == distanceMeters
            ? _value.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as int?,
        durationSeconds: freezed == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        computedAt: freezed == computedAt
            ? _value.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteResultImpl implements _RouteResult {
  const _$RouteResultImpl({
    required this.routeId,
    required this.polyline,
    final List<String> maneuvers = const <String>[],
    this.distanceMeters,
    this.durationSeconds,
    this.computedAt,
  }) : _maneuvers = maneuvers;

  factory _$RouteResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteResultImplFromJson(json);

  @override
  final String routeId;
  @override
  final String polyline;
  final List<String> _maneuvers;
  @override
  @JsonKey()
  List<String> get maneuvers {
    if (_maneuvers is EqualUnmodifiableListView) return _maneuvers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maneuvers);
  }

  @override
  final int? distanceMeters;
  @override
  final int? durationSeconds;
  @override
  final DateTime? computedAt;

  @override
  String toString() {
    return 'RouteResult(routeId: $routeId, polyline: $polyline, maneuvers: $maneuvers, distanceMeters: $distanceMeters, durationSeconds: $durationSeconds, computedAt: $computedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResultImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.polyline, polyline) ||
                other.polyline == polyline) &&
            const DeepCollectionEquality().equals(
              other._maneuvers,
              _maneuvers,
            ) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    routeId,
    polyline,
    const DeepCollectionEquality().hash(_maneuvers),
    distanceMeters,
    durationSeconds,
    computedAt,
  );

  /// Create a copy of RouteResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteResultImplCopyWith<_$RouteResultImpl> get copyWith =>
      __$$RouteResultImplCopyWithImpl<_$RouteResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteResultImplToJson(this);
  }
}

abstract class _RouteResult implements RouteResult {
  const factory _RouteResult({
    required final String routeId,
    required final String polyline,
    final List<String> maneuvers,
    final int? distanceMeters,
    final int? durationSeconds,
    final DateTime? computedAt,
  }) = _$RouteResultImpl;

  factory _RouteResult.fromJson(Map<String, dynamic> json) =
      _$RouteResultImpl.fromJson;

  @override
  String get routeId;
  @override
  String get polyline;
  @override
  List<String> get maneuvers;
  @override
  int? get distanceMeters;
  @override
  int? get durationSeconds;
  @override
  DateTime? get computedAt;

  /// Create a copy of RouteResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteResultImplCopyWith<_$RouteResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
