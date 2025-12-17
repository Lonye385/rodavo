// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HazardEvent _$HazardEventFromJson(Map<String, dynamic> json) {
  return _HazardEvent.fromJson(json);
}

/// @nodoc
mixin _$HazardEvent {
  String get id => throw _privateConstructorUsedError;
  HazardType get type => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HazardEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HazardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HazardEventCopyWith<HazardEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HazardEventCopyWith<$Res> {
  factory $HazardEventCopyWith(
    HazardEvent value,
    $Res Function(HazardEvent) then,
  ) = _$HazardEventCopyWithImpl<$Res, HazardEvent>;
  @useResult
  $Res call({
    String id,
    HazardType type,
    double lat,
    double lng,
    String? title,
    String? countryCode,
    bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$HazardEventCopyWithImpl<$Res, $Val extends HazardEvent>
    implements $HazardEventCopyWith<$Res> {
  _$HazardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HazardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? lat = null,
    Object? lng = null,
    Object? title = freezed,
    Object? countryCode = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as HazardType,
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lng: null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            countryCode: freezed == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$HazardEventImplCopyWith<$Res>
    implements $HazardEventCopyWith<$Res> {
  factory _$$HazardEventImplCopyWith(
    _$HazardEventImpl value,
    $Res Function(_$HazardEventImpl) then,
  ) = __$$HazardEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    HazardType type,
    double lat,
    double lng,
    String? title,
    String? countryCode,
    bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$HazardEventImplCopyWithImpl<$Res>
    extends _$HazardEventCopyWithImpl<$Res, _$HazardEventImpl>
    implements _$$HazardEventImplCopyWith<$Res> {
  __$$HazardEventImplCopyWithImpl(
    _$HazardEventImpl _value,
    $Res Function(_$HazardEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HazardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? lat = null,
    Object? lng = null,
    Object? title = freezed,
    Object? countryCode = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$HazardEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HazardType,
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lng: null == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryCode: freezed == countryCode
            ? _value.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$HazardEventImpl implements _HazardEvent {
  const _$HazardEventImpl({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
    this.title,
    this.countryCode,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  factory _$HazardEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$HazardEventImplFromJson(json);

  @override
  final String id;
  @override
  final HazardType type;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String? title;
  @override
  final String? countryCode;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'HazardEvent(id: $id, type: $type, lat: $lat, lng: $lng, title: $title, countryCode: $countryCode, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HazardEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    lat,
    lng,
    title,
    countryCode,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of HazardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HazardEventImplCopyWith<_$HazardEventImpl> get copyWith =>
      __$$HazardEventImplCopyWithImpl<_$HazardEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HazardEventImplToJson(this);
  }
}

abstract class _HazardEvent implements HazardEvent {
  const factory _HazardEvent({
    required final String id,
    required final HazardType type,
    required final double lat,
    required final double lng,
    final String? title,
    final String? countryCode,
    final bool isActive,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$HazardEventImpl;

  factory _HazardEvent.fromJson(Map<String, dynamic> json) =
      _$HazardEventImpl.fromJson;

  @override
  String get id;
  @override
  HazardType get type;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String? get title;
  @override
  String? get countryCode;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of HazardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HazardEventImplCopyWith<_$HazardEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
