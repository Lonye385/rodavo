import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_event.freezed.dart';
part 'hazard_event.g.dart';

enum HazardType {
  fixedRadar,
  mobileRadar,
  police,
  danger,
}

@freezed
class HazardEvent with _$HazardEvent {
  const factory HazardEvent({
    required String id,
    required HazardType type,
    required double lat,
    required double lng,
    String? title,
    String? countryCode,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HazardEvent;

  factory HazardEvent.fromJson(Map<String, dynamic> json) => _$HazardEventFromJson(json);
}
