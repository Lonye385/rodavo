// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CacheEntry _$CacheEntryFromJson(Map<String, dynamic> json) {
  return _CacheEntry.fromJson(json);
}

/// @nodoc
mixin _$CacheEntry {
  String get key => throw _privateConstructorUsedError;
  String get payloadJson => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  int get hitCount => throw _privateConstructorUsedError;
  DateTime? get lastAccessAt => throw _privateConstructorUsedError;

  /// Serializes this CacheEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CacheEntryCopyWith<CacheEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheEntryCopyWith<$Res> {
  factory $CacheEntryCopyWith(
    CacheEntry value,
    $Res Function(CacheEntry) then,
  ) = _$CacheEntryCopyWithImpl<$Res, CacheEntry>;
  @useResult
  $Res call({
    String key,
    String payloadJson,
    DateTime createdAt,
    DateTime? expiresAt,
    int hitCount,
    DateTime? lastAccessAt,
  });
}

/// @nodoc
class _$CacheEntryCopyWithImpl<$Res, $Val extends CacheEntry>
    implements $CacheEntryCopyWith<$Res> {
  _$CacheEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? payloadJson = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? hitCount = null,
    Object? lastAccessAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String,
            payloadJson: null == payloadJson
                ? _value.payloadJson
                : payloadJson // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            hitCount: null == hitCount
                ? _value.hitCount
                : hitCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lastAccessAt: freezed == lastAccessAt
                ? _value.lastAccessAt
                : lastAccessAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CacheEntryImplCopyWith<$Res>
    implements $CacheEntryCopyWith<$Res> {
  factory _$$CacheEntryImplCopyWith(
    _$CacheEntryImpl value,
    $Res Function(_$CacheEntryImpl) then,
  ) = __$$CacheEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String key,
    String payloadJson,
    DateTime createdAt,
    DateTime? expiresAt,
    int hitCount,
    DateTime? lastAccessAt,
  });
}

/// @nodoc
class __$$CacheEntryImplCopyWithImpl<$Res>
    extends _$CacheEntryCopyWithImpl<$Res, _$CacheEntryImpl>
    implements _$$CacheEntryImplCopyWith<$Res> {
  __$$CacheEntryImplCopyWithImpl(
    _$CacheEntryImpl _value,
    $Res Function(_$CacheEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? payloadJson = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? hitCount = null,
    Object? lastAccessAt = freezed,
  }) {
    return _then(
      _$CacheEntryImpl(
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        payloadJson: null == payloadJson
            ? _value.payloadJson
            : payloadJson // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        hitCount: null == hitCount
            ? _value.hitCount
            : hitCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastAccessAt: freezed == lastAccessAt
            ? _value.lastAccessAt
            : lastAccessAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CacheEntryImpl implements _CacheEntry {
  const _$CacheEntryImpl({
    required this.key,
    required this.payloadJson,
    required this.createdAt,
    this.expiresAt,
    this.hitCount = 0,
    this.lastAccessAt,
  });

  factory _$CacheEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CacheEntryImplFromJson(json);

  @override
  final String key;
  @override
  final String payloadJson;
  @override
  final DateTime createdAt;
  @override
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final int hitCount;
  @override
  final DateTime? lastAccessAt;

  @override
  String toString() {
    return 'CacheEntry(key: $key, payloadJson: $payloadJson, createdAt: $createdAt, expiresAt: $expiresAt, hitCount: $hitCount, lastAccessAt: $lastAccessAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheEntryImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.payloadJson, payloadJson) ||
                other.payloadJson == payloadJson) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.hitCount, hitCount) ||
                other.hitCount == hitCount) &&
            (identical(other.lastAccessAt, lastAccessAt) ||
                other.lastAccessAt == lastAccessAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    key,
    payloadJson,
    createdAt,
    expiresAt,
    hitCount,
    lastAccessAt,
  );

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheEntryImplCopyWith<_$CacheEntryImpl> get copyWith =>
      __$$CacheEntryImplCopyWithImpl<_$CacheEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CacheEntryImplToJson(this);
  }
}

abstract class _CacheEntry implements CacheEntry {
  const factory _CacheEntry({
    required final String key,
    required final String payloadJson,
    required final DateTime createdAt,
    final DateTime? expiresAt,
    final int hitCount,
    final DateTime? lastAccessAt,
  }) = _$CacheEntryImpl;

  factory _CacheEntry.fromJson(Map<String, dynamic> json) =
      _$CacheEntryImpl.fromJson;

  @override
  String get key;
  @override
  String get payloadJson;
  @override
  DateTime get createdAt;
  @override
  DateTime? get expiresAt;
  @override
  int get hitCount;
  @override
  DateTime? get lastAccessAt;

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheEntryImplCopyWith<_$CacheEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
