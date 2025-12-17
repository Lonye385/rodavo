import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/vehicle_profile_local_datasource.dart';
import '../../data/repositories/vehicle_profile_repository_impl.dart';
import '../../domain/entities/vehicle_profile.dart';
import '../../domain/repositories/vehicle_profile_repository.dart';
import '../../domain/usecases/get_vehicle_profile.dart';
import '../../domain/usecases/save_vehicle_profile.dart';

part 'vehicle_profile_providers.g.dart';

@riverpod
VehicleProfileLocalDataSource vehicleProfileLocalDataSource(Ref ref) {
  return VehicleProfileLocalDataSource();
}

@riverpod
VehicleProfileRepository vehicleProfileRepository(Ref ref) {
  final local = ref.watch(vehicleProfileLocalDataSourceProvider);
  return VehicleProfileRepositoryImpl(local);
}

@riverpod
GetVehicleProfile getVehicleProfile(Ref ref) {
  return GetVehicleProfile(ref.watch(vehicleProfileRepositoryProvider));
}

@riverpod
SaveVehicleProfile saveVehicleProfile(Ref ref) {
  return SaveVehicleProfile(ref.watch(vehicleProfileRepositoryProvider));
}

@riverpod
Future<VehicleProfile?> vehicleProfile(Ref ref) async {
  return ref.watch(getVehicleProfileProvider).call();
}
