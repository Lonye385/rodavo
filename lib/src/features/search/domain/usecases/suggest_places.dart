import '../entities/place_suggestion.dart';
import '../repositories/place_search_repository.dart';

class SuggestPlaces {
  const SuggestPlaces(this._repo);

  final PlaceSearchRepository _repo;

  Future<List<PlaceSuggestion>> call({required String query, String? locale}) => _repo.suggest(query: query, locale: locale);
}
