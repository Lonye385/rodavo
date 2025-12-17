import 'package:freezed_annotation/freezed_annotation.dart';

part 'speed_limit_result.freezed.dart';
part 'speed_limit_result.g.dart';

@freezed
class SpeedLimitResult with _$SpeedLimitResult {
  const factory SpeedLimitResult({
    required double lat,
    required double lng,
    int? maxKph,
    String? source,
    DateTime? fetchedAt,
  }) = _SpeedLimitResult;

  factory SpeedLimitResult.fromJson(Map<String, dynamic> json) => _$SpeedLimitResultFromJson(json);
}
