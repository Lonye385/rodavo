import '../entities/vehicle_profile.dart';
import '../repositories/vehicle_profile_repository.dart';

class GetVehicleProfile {
  const GetVehicleProfile(this._repo);

  final VehicleProfileRepository _repo;

  Future<VehicleProfile?> call() => _repo.get();
}
