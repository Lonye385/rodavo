import '../entities/place_suggestion.dart';

abstract interface class PlaceSearchRepository {
  Future<List<PlaceSuggestion>> suggest({required String query, String? locale});
}
