import '../../domain/entities/vehicle_profile.dart';
import '../../domain/repositories/vehicle_profile_repository.dart';
import '../datasources/vehicle_profile_local_datasource.dart';

class VehicleProfileRepositoryImpl implements VehicleProfileRepository {
  VehicleProfileRepositoryImpl(this._local);

  final VehicleProfileLocalDataSource _local;

  @override
  Future<void> clear() => _local.clear();

  @override
  Future<VehicleProfile?> get() => _local.read();

  @override
  Future<void> save(VehicleProfile profile) => _local.write(profile);
}
