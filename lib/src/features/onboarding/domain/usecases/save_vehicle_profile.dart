import '../entities/vehicle_profile.dart';
import '../repositories/vehicle_profile_repository.dart';

class SaveVehicleProfile {
  const SaveVehicleProfile(this._repo);

  final VehicleProfileRepository _repo;

  Future<void> call(VehicleProfile profile) => _repo.save(profile);
}
