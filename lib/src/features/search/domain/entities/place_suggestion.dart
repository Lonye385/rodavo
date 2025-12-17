import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_suggestion.freezed.dart';
part 'place_suggestion.g.dart';

@freezed
class PlaceSuggestion with _$PlaceSuggestion {
  const factory PlaceSuggestion({
    required String id,
    required String title,
    String? subtitle,
    double? lat,
    double? lng,
  }) = _PlaceSuggestion;

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) => _$PlaceSuggestionFromJson(json);
}
