// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleProfile _$VehicleProfileFromJson(Map<String, dynamic> json) {
  return _VehicleProfile.fromJson(json);
}

/// @nodoc
mixin _$VehicleProfile {
  VehicleGroup get vehicleGroup => throw _privateConstructorUsedError;
  VehicleType get vehicleType => throw _privateConstructorUsedError;
  List<String> get waypoints => throw _privateConstructorUsedError;
  String get vehicleDisplayName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VehicleProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleProfileCopyWith<VehicleProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleProfileCopyWith<$Res> {
  factory $VehicleProfileCopyWith(
    VehicleProfile value,
    $Res Function(VehicleProfile) then,
  ) = _$VehicleProfileCopyWithImpl<$Res, VehicleProfile>;
  @useResult
  $Res call({
    VehicleGroup vehicleGroup,
    VehicleType vehicleType,
    List<String> waypoints,
    String vehicleDisplayName,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$VehicleProfileCopyWithImpl<$Res, $Val extends VehicleProfile>
    implements $VehicleProfileCopyWith<$Res> {
  _$VehicleProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleGroup = null,
    Object? vehicleType = null,
    Object? waypoints = null,
    Object? vehicleDisplayName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            vehicleGroup: null == vehicleGroup
                ? _value.vehicleGroup
                : vehicleGroup // ignore: cast_nullable_to_non_nullable
                      as VehicleGroup,
            vehicleType: null == vehicleType
                ? _value.vehicleType
                : vehicleType // ignore: cast_nullable_to_non_nullable
                      as VehicleType,
            waypoints: null == waypoints
                ? _value.waypoints
                : waypoints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            vehicleDisplayName: null == vehicleDisplayName
                ? _value.vehicleDisplayName
                : vehicleDisplayName // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleProfileImplCopyWith<$Res>
    implements $VehicleProfileCopyWith<$Res> {
  factory _$$VehicleProfileImplCopyWith(
    _$VehicleProfileImpl value,
    $Res Function(_$VehicleProfileImpl) then,
  ) = __$$VehicleProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    VehicleGroup vehicleGroup,
    VehicleType vehicleType,
    List<String> waypoints,
    String vehicleDisplayName,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$VehicleProfileImplCopyWithImpl<$Res>
    extends _$VehicleProfileCopyWithImpl<$Res, _$VehicleProfileImpl>
    implements _$$VehicleProfileImplCopyWith<$Res> {
  __$$VehicleProfileImplCopyWithImpl(
    _$VehicleProfileImpl _value,
    $Res Function(_$VehicleProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleGroup = null,
    Object? vehicleType = null,
    Object? waypoints = null,
    Object? vehicleDisplayName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VehicleProfileImpl(
        vehicleGroup: null == vehicleGroup
            ? _value.vehicleGroup
            : vehicleGroup // ignore: cast_nullable_to_non_nullable
                  as VehicleGroup,
        vehicleType: null == vehicleType
            ? _value.vehicleType
            : vehicleType // ignore: cast_nullable_to_non_nullable
                  as VehicleType,
        waypoints: null == waypoints
            ? _value._waypoints
            : waypoints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        vehicleDisplayName: null == vehicleDisplayName
            ? _value.vehicleDisplayName
            : vehicleDisplayName // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleProfileImpl implements _VehicleProfile {
  const _$VehicleProfileImpl({
    required this.vehicleGroup,
    required this.vehicleType,
    required final List<String> waypoints,
    this.vehicleDisplayName = '',
    this.createdAt,
    this.updatedAt,
  }) : _waypoints = waypoints;

  factory _$VehicleProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleProfileImplFromJson(json);

  @override
  final VehicleGroup vehicleGroup;
  @override
  final VehicleType vehicleType;
  final List<String> _waypoints;
  @override
  List<String> get waypoints {
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waypoints);
  }

  @override
  @JsonKey()
  final String vehicleDisplayName;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VehicleProfile(vehicleGroup: $vehicleGroup, vehicleType: $vehicleType, waypoints: $waypoints, vehicleDisplayName: $vehicleDisplayName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleProfileImpl &&
            (identical(other.vehicleGroup, vehicleGroup) ||
                other.vehicleGroup == vehicleGroup) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            const DeepCollectionEquality().equals(
              other._waypoints,
              _waypoints,
            ) &&
            (identical(other.vehicleDisplayName, vehicleDisplayName) ||
                other.vehicleDisplayName == vehicleDisplayName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    vehicleGroup,
    vehicleType,
    const DeepCollectionEquality().hash(_waypoints),
    vehicleDisplayName,
    createdAt,
    updatedAt,
  );

  /// Create a copy of VehicleProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleProfileImplCopyWith<_$VehicleProfileImpl> get copyWith =>
      __$$VehicleProfileImplCopyWithImpl<_$VehicleProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleProfileImplToJson(this);
  }
}

abstract class _VehicleProfile implements VehicleProfile {
  const factory _VehicleProfile({
    required final VehicleGroup vehicleGroup,
    required final VehicleType vehicleType,
    required final List<String> waypoints,
    final String vehicleDisplayName,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$VehicleProfileImpl;

  factory _VehicleProfile.fromJson(Map<String, dynamic> json) =
      _$VehicleProfileImpl.fromJson;

  @override
  VehicleGroup get vehicleGroup;
  @override
  VehicleType get vehicleType;
  @override
  List<String> get waypoints;
  @override
  String get vehicleDisplayName;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of VehicleProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleProfileImplCopyWith<_$VehicleProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
