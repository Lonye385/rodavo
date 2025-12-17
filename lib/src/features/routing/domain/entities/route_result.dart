import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_result.freezed.dart';
part 'route_result.g.dart';

@freezed
class RouteResult with _$RouteResult {
  const factory RouteResult({
    required String routeId,
    required String polyline,
    @Default(<String>[]) List<String> maneuvers,
    int? distanceMeters,
    int? durationSeconds,
    DateTime? computedAt,
  }) = _RouteResult;

  factory RouteResult.fromJson(Map<String, dynamic> json) => _$RouteResultFromJson(json);
}
