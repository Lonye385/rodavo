import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/vehicle_profile.dart';
import 'vehicle_profile_providers.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  FutureOr<void> build() {
    // no-op; actions are invoked explicitly from UI.
  }

  Future<void> save({
    required VehicleGroup group,
    required VehicleType type,
    required List<String> waypoints,
    String vehicleDisplayName = '',
  }) async {
    state = const AsyncLoading();

    final cleaned = waypoints
        .map((w) => w.trim())
        .where((w) => w.isNotEmpty)
        .toList(growable: false);

    if (cleaned.isEmpty) {
      state = AsyncError(ArgumentError('É obrigatório indicar pelo menos 1 waypoint.'), StackTrace.current);
      return;
    }

    final profile = VehicleProfile(
      vehicleGroup: group,
      vehicleType: type,
      waypoints: cleaned,
      vehicleDisplayName: vehicleDisplayName,
    );

    await ref.read(saveVehicleProfileProvider).call(profile);
    ref.invalidate(vehicleProfileProvider);

    state = const AsyncData(null);
  }
}
