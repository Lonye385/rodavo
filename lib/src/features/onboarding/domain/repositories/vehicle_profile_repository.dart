import '../entities/vehicle_profile.dart';

abstract interface class VehicleProfileRepository {
  Future<VehicleProfile?> get();
  Future<void> save(VehicleProfile profile);
  Future<void> clear();
}
