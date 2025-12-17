import '../../domain/entities/place_suggestion.dart';

abstract interface class HerePlaceSearchDataSource {
  Future<List<PlaceSuggestion>> suggest({required String query, String? locale});
}

class HerePlaceSearchDataSourceStub implements HerePlaceSearchDataSource {
  @override
  Future<List<PlaceSuggestion>> suggest({required String query, String? locale}) async {
    // TODO: Replace with HERE Geocoding & Search.
    if (query.trim().isEmpty) return const [];

    return List.generate(
      5,
      (i) => PlaceSuggestion(
        id: 'stub_${query}_$i',
        title: '$query #$i',
        subtitle: locale,
      ),
    );
  }
}
