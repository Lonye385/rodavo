import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../onboarding/domain/entities/vehicle_profile.dart';
import 'route_options.dart';

part 'route_request.freezed.dart';
part 'route_request.g.dart';

@freezed
class RouteRequest with _$RouteRequest {
  const factory RouteRequest({
    required VehicleProfile vehicle,
    required List<String> waypoints,
    @Default(RouteOptions()) RouteOptions options,
    String? locale,
  }) = _RouteRequest;

  factory RouteRequest.fromJson(Map<String, dynamic> json) => _$RouteRequestFromJson(json);
}
