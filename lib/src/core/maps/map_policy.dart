import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_policy.freezed.dart';
part 'map_policy.g.dart';

@freezed
class MapPolicy with _$MapPolicy {
  const factory MapPolicy({
    /// If true, show traffic layer (tiles/cost).
    required bool trafficEnabled,

    /// If false, pan/zoom gestures should be disabled in driving mode.
    required bool allowPanZoom,

    /// Suggested map refresh throttle while driving.
    /// Lower = smoother but higher tile usage.
    required Duration cameraUpdateInterval,

    /// Suggested traffic refresh cadence (if enabled).
    required Duration trafficRefreshInterval,

    /// If true, use simplified rendering/animations.
    required bool lowSpecRendering,

    /// Soft budget for map tile usage (for UI and future enforcement).
    int? maxVectorTilesPer30Days,
    int? maxTrafficTilesPer30Days,
  }) = _MapPolicy;

  factory MapPolicy.fromJson(Map<String, dynamic> json) => _$MapPolicyFromJson(json);
}
