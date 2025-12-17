import 'usage_event_type.dart';

/// CPM (EUR per 1,000 transactions) based on your provided simulation table.
const Map<UsageEventType, double> hereCpmEur = {
  UsageEventType.vectorTile: 0.06,
  UsageEventType.trafficVectorTile: 0.09,
  UsageEventType.carRouting: 0.65,
  UsageEventType.truckRouting: 2.14,
  UsageEventType.autosuggest: 2.14,
  UsageEventType.discoverSearch: 2.12,
  UsageEventType.geocoding: 0.65,
  UsageEventType.speedLimits: 0.43,
};
