import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_options.freezed.dart';
part 'route_options.g.dart';

@freezed
class RouteOptions with _$RouteOptions {
  const factory RouteOptions({
    @Default(false) bool avoidTolls,
    @Default(false) bool avoidFerries,
    @Default(false) bool preferTruckRouting,
    @Default(false) bool includeTraffic,
  }) = _RouteOptions;

  factory RouteOptions.fromJson(Map<String, dynamic> json) => _$RouteOptionsFromJson(json);
}
