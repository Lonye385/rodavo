import '../usage_event_type.dart';
import 'plan_tier.dart';

class PlanPolicy {
  const PlanPolicy(this.tier);

  final PlanTier tier;

  /// Hard caps per 30 days, per event type.
  /// These are *business safety rails* to guarantee margin.
  Map<UsageEventType, int> monthlyCaps() {
    switch (tier) {
      case PlanTier.basic490:
        return const {
          // Target HERE variable cost ceiling ~€0.85 / 30d
          // Vector tiles: 6k -> €0.36
          // Car routing: 200 -> €0.13
          // Autosuggest: 120 -> €0.26
          // Search: 30 -> €0.06
          // Geocoding: 60 -> €0.04
          // Traffic: 0
          UsageEventType.carRouting: 200,
          UsageEventType.autosuggest: 120,
          UsageEventType.discoverSearch: 30,
          UsageEventType.geocoding: 60,
          UsageEventType.speedLimits: 0,
          // Tiles will be enforced once map integration exists.
          UsageEventType.vectorTile: 6000,
          UsageEventType.trafficVectorTile: 0,
        };
      case PlanTier.pro1490:
        return const {
          // Target HERE variable cost ceiling ~€3.6–€4.0 / 30d
          // (so €14.90 can stay profitable after store fees + fixed costs).
          // Vector tiles: 20k -> €1.20
          // Traffic tiles: 3k -> €0.27
          // Car routing: 800 -> €0.52
          // Truck routing: 300 -> €0.64
          // Autosuggest: 300 -> €0.64
          // Search: 100 -> €0.21
          // Geocoding: 200 -> €0.13
          // Speed limits: 0 (prefer from route spans; avoid polling)
          UsageEventType.carRouting: 800,
          UsageEventType.truckRouting: 300,
          UsageEventType.autosuggest: 300,
          UsageEventType.discoverSearch: 100,
          UsageEventType.geocoding: 200,
          UsageEventType.speedLimits: 0,
          UsageEventType.vectorTile: 20000,
          UsageEventType.trafficVectorTile: 3000,
        };
    }
  }

  /// Soft threshold to start "Navigation Lite" before the hard stop.
  double softThreshold() {
    return tier == PlanTier.basic490 ? 0.8 : 0.85;
  }
}
