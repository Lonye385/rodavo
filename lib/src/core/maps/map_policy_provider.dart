import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../device/device_check_provider.dart';
import '../usage/usage_event_type.dart';
import '../usage/budget/budget_providers.dart';
import '../usage/budget/lite_mode_provider.dart';
import '../usage/budget/plan_tier.dart';
import 'map_policy.dart';

part 'map_policy_provider.g.dart';

@riverpod
Future<MapPolicy> mapPolicy(Ref ref) async {
  final isLowSpec = await ref.watch(isLowSpecModeProvider.future);
  final lite = await ref.watch(shouldUseLiteModeProvider.future);
  final plan = ref.watch(planPolicyProvider);
  final tier = ref.watch(planTierProvider);

  final caps = plan.monthlyCaps();

  // CEO policy:
  // - basic: traffic off, aggressive throttling, gestures off while driving.
  // - pro: traffic allowed but *windowed*, moderate throttling.
  // - lite mode: force traffic off + more throttling.
  final trafficEnabled = tier == PlanTier.pro1490 && !lite;

  final cameraInterval = lite
      ? const Duration(milliseconds: 1200)
      : (tier == PlanTier.pro1490
          ? const Duration(milliseconds: 600)
          : const Duration(milliseconds: 900));

  final trafficRefresh = trafficEnabled ? const Duration(minutes: 10) : const Duration(hours: 999);

  final allowPanZoom = tier == PlanTier.pro1490 && !lite;

  return MapPolicy(
    trafficEnabled: trafficEnabled,
    allowPanZoom: allowPanZoom,
    cameraUpdateInterval: cameraInterval,
    trafficRefreshInterval: trafficRefresh,
    lowSpecRendering: isLowSpec || lite,
    maxVectorTilesPer30Days: caps[UsageEventType.vectorTile],
    maxTrafficTilesPer30Days: caps[UsageEventType.trafficVectorTile],
  );
}

 
