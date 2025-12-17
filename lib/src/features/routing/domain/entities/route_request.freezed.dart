// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RouteRequest _$RouteRequestFromJson(Map<String, dynamic> json) {
  return _RouteRequest.fromJson(json);
}

/// @nodoc
mixin _$RouteRequest {
  VehicleProfile get vehicle => throw _privateConstructorUsedError;
  List<String> get waypoints => throw _privateConstructorUsedError;
  RouteOptions get options => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;

  /// Serializes this RouteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteRequestCopyWith<RouteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteRequestCopyWith<$Res> {
  factory $RouteRequestCopyWith(
    RouteRequest value,
    $Res Function(RouteRequest) then,
  ) = _$RouteRequestCopyWithImpl<$Res, RouteRequest>;
  @useResult
  $Res call({
    VehicleProfile vehicle,
    List<String> waypoints,
    RouteOptions options,
    String? locale,
  });

  $VehicleProfileCopyWith<$Res> get vehicle;
  $RouteOptionsCopyWith<$Res> get options;
}

/// @nodoc
class _$RouteRequestCopyWithImpl<$Res, $Val extends RouteRequest>
    implements $RouteRequestCopyWith<$Res> {
  _$RouteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? waypoints = null,
    Object? options = null,
    Object? locale = freezed,
  }) {
    return _then(
      _value.copyWith(
            vehicle: null == vehicle
                ? _value.vehicle
                : vehicle // ignore: cast_nullable_to_non_nullable
                      as VehicleProfile,
            waypoints: null == waypoints
                ? _value.waypoints
                : waypoints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as RouteOptions,
            locale: freezed == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleProfileCopyWith<$Res> get vehicle {
    return $VehicleProfileCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteOptionsCopyWith<$Res> get options {
    return $RouteOptionsCopyWith<$Res>(_value.options, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteRequestImplCopyWith<$Res>
    implements $RouteRequestCopyWith<$Res> {
  factory _$$RouteRequestImplCopyWith(
    _$RouteRequestImpl value,
    $Res Function(_$RouteRequestImpl) then,
  ) = __$$RouteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    VehicleProfile vehicle,
    List<String> waypoints,
    RouteOptions options,
    String? locale,
  });

  @override
  $VehicleProfileCopyWith<$Res> get vehicle;
  @override
  $RouteOptionsCopyWith<$Res> get options;
}

/// @nodoc
class __$$RouteRequestImplCopyWithImpl<$Res>
    extends _$RouteRequestCopyWithImpl<$Res, _$RouteRequestImpl>
    implements _$$RouteRequestImplCopyWith<$Res> {
  __$$RouteRequestImplCopyWithImpl(
    _$RouteRequestImpl _value,
    $Res Function(_$RouteRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? waypoints = null,
    Object? options = null,
    Object? locale = freezed,
  }) {
    return _then(
      _$RouteRequestImpl(
        vehicle: null == vehicle
            ? _value.vehicle
            : vehicle // ignore: cast_nullable_to_non_nullable
                  as VehicleProfile,
        waypoints: null == waypoints
            ? _value._waypoints
            : waypoints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        options: null == options
            ? _value.options
            : options // ignore: cast_nullable_to_non_nullable
                  as RouteOptions,
        locale: freezed == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteRequestImpl implements _RouteRequest {
  const _$RouteRequestImpl({
    required this.vehicle,
    required final List<String> waypoints,
    this.options = const RouteOptions(),
    this.locale,
  }) : _waypoints = waypoints;

  factory _$RouteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteRequestImplFromJson(json);

  @override
  final VehicleProfile vehicle;
  final List<String> _waypoints;
  @override
  List<String> get waypoints {
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waypoints);
  }

  @override
  @JsonKey()
  final RouteOptions options;
  @override
  final String? locale;

  @override
  String toString() {
    return 'RouteRequest(vehicle: $vehicle, waypoints: $waypoints, options: $options, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteRequestImpl &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            const DeepCollectionEquality().equals(
              other._waypoints,
              _waypoints,
            ) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    vehicle,
    const DeepCollectionEquality().hash(_waypoints),
    options,
    locale,
  );

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteRequestImplCopyWith<_$RouteRequestImpl> get copyWith =>
      __$$RouteRequestImplCopyWithImpl<_$RouteRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteRequestImplToJson(this);
  }
}

abstract class _RouteRequest implements RouteRequest {
  const factory _RouteRequest({
    required final VehicleProfile vehicle,
    required final List<String> waypoints,
    final RouteOptions options,
    final String? locale,
  }) = _$RouteRequestImpl;

  factory _RouteRequest.fromJson(Map<String, dynamic> json) =
      _$RouteRequestImpl.fromJson;

  @override
  VehicleProfile get vehicle;
  @override
  List<String> get waypoints;
  @override
  RouteOptions get options;
  @override
  String? get locale;

  /// Create a copy of RouteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteRequestImplCopyWith<_$RouteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
