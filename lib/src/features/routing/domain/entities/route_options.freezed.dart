// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RouteOptions _$RouteOptionsFromJson(Map<String, dynamic> json) {
  return _RouteOptions.fromJson(json);
}

/// @nodoc
mixin _$RouteOptions {
  bool get avoidTolls => throw _privateConstructorUsedError;
  bool get avoidFerries => throw _privateConstructorUsedError;
  bool get preferTruckRouting => throw _privateConstructorUsedError;
  bool get includeTraffic => throw _privateConstructorUsedError;

  /// Serializes this RouteOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteOptionsCopyWith<RouteOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteOptionsCopyWith<$Res> {
  factory $RouteOptionsCopyWith(
    RouteOptions value,
    $Res Function(RouteOptions) then,
  ) = _$RouteOptionsCopyWithImpl<$Res, RouteOptions>;
  @useResult
  $Res call({
    bool avoidTolls,
    bool avoidFerries,
    bool preferTruckRouting,
    bool includeTraffic,
  });
}

/// @nodoc
class _$RouteOptionsCopyWithImpl<$Res, $Val extends RouteOptions>
    implements $RouteOptionsCopyWith<$Res> {
  _$RouteOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avoidTolls = null,
    Object? avoidFerries = null,
    Object? preferTruckRouting = null,
    Object? includeTraffic = null,
  }) {
    return _then(
      _value.copyWith(
            avoidTolls: null == avoidTolls
                ? _value.avoidTolls
                : avoidTolls // ignore: cast_nullable_to_non_nullable
                      as bool,
            avoidFerries: null == avoidFerries
                ? _value.avoidFerries
                : avoidFerries // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferTruckRouting: null == preferTruckRouting
                ? _value.preferTruckRouting
                : preferTruckRouting // ignore: cast_nullable_to_non_nullable
                      as bool,
            includeTraffic: null == includeTraffic
                ? _value.includeTraffic
                : includeTraffic // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteOptionsImplCopyWith<$Res>
    implements $RouteOptionsCopyWith<$Res> {
  factory _$$RouteOptionsImplCopyWith(
    _$RouteOptionsImpl value,
    $Res Function(_$RouteOptionsImpl) then,
  ) = __$$RouteOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool avoidTolls,
    bool avoidFerries,
    bool preferTruckRouting,
    bool includeTraffic,
  });
}

/// @nodoc
class __$$RouteOptionsImplCopyWithImpl<$Res>
    extends _$RouteOptionsCopyWithImpl<$Res, _$RouteOptionsImpl>
    implements _$$RouteOptionsImplCopyWith<$Res> {
  __$$RouteOptionsImplCopyWithImpl(
    _$RouteOptionsImpl _value,
    $Res Function(_$RouteOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avoidTolls = null,
    Object? avoidFerries = null,
    Object? preferTruckRouting = null,
    Object? includeTraffic = null,
  }) {
    return _then(
      _$RouteOptionsImpl(
        avoidTolls: null == avoidTolls
            ? _value.avoidTolls
            : avoidTolls // ignore: cast_nullable_to_non_nullable
                  as bool,
        avoidFerries: null == avoidFerries
            ? _value.avoidFerries
            : avoidFerries // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferTruckRouting: null == preferTruckRouting
            ? _value.preferTruckRouting
            : preferTruckRouting // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeTraffic: null == includeTraffic
            ? _value.includeTraffic
            : includeTraffic // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteOptionsImpl implements _RouteOptions {
  const _$RouteOptionsImpl({
    this.avoidTolls = false,
    this.avoidFerries = false,
    this.preferTruckRouting = false,
    this.includeTraffic = false,
  });

  factory _$RouteOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteOptionsImplFromJson(json);

  @override
  @JsonKey()
  final bool avoidTolls;
  @override
  @JsonKey()
  final bool avoidFerries;
  @override
  @JsonKey()
  final bool preferTruckRouting;
  @override
  @JsonKey()
  final bool includeTraffic;

  @override
  String toString() {
    return 'RouteOptions(avoidTolls: $avoidTolls, avoidFerries: $avoidFerries, preferTruckRouting: $preferTruckRouting, includeTraffic: $includeTraffic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteOptionsImpl &&
            (identical(other.avoidTolls, avoidTolls) ||
                other.avoidTolls == avoidTolls) &&
            (identical(other.avoidFerries, avoidFerries) ||
                other.avoidFerries == avoidFerries) &&
            (identical(other.preferTruckRouting, preferTruckRouting) ||
                other.preferTruckRouting == preferTruckRouting) &&
            (identical(other.includeTraffic, includeTraffic) ||
                other.includeTraffic == includeTraffic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    avoidTolls,
    avoidFerries,
    preferTruckRouting,
    includeTraffic,
  );

  /// Create a copy of RouteOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteOptionsImplCopyWith<_$RouteOptionsImpl> get copyWith =>
      __$$RouteOptionsImplCopyWithImpl<_$RouteOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteOptionsImplToJson(this);
  }
}

abstract class _RouteOptions implements RouteOptions {
  const factory _RouteOptions({
    final bool avoidTolls,
    final bool avoidFerries,
    final bool preferTruckRouting,
    final bool includeTraffic,
  }) = _$RouteOptionsImpl;

  factory _RouteOptions.fromJson(Map<String, dynamic> json) =
      _$RouteOptionsImpl.fromJson;

  @override
  bool get avoidTolls;
  @override
  bool get avoidFerries;
  @override
  bool get preferTruckRouting;
  @override
  bool get includeTraffic;

  /// Create a copy of RouteOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteOptionsImplCopyWith<_$RouteOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
