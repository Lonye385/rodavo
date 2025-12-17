import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_profile.freezed.dart';
part 'vehicle_profile.g.dart';

enum VehicleGroup {
  groupA,
  groupB,
}

enum VehicleType {
  truck,
  bus,
  rv,
  car,
  moto,
}

@freezed
class VehicleProfile with _$VehicleProfile {
  const factory VehicleProfile({
    required VehicleGroup vehicleGroup,
    required VehicleType vehicleType,
    required List<String> waypoints,
    @Default('') String vehicleDisplayName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VehicleProfile;

  factory VehicleProfile.fromJson(Map<String, dynamic> json) => _$VehicleProfileFromJson(json);
}
