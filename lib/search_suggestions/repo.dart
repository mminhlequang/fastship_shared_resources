import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class SearchSuggestionsRepo {
  SearchSuggestionsRepo._();
  static SearchSuggestionsRepo? _instance;

  factory SearchSuggestionsRepo([SearchSuggestionsApi? api]) {
    _instance ??= SearchSuggestionsRepo._();
    _instance!._api = api ?? SearchSuggestionsApiImpl();
    return _instance!;
  }

  late SearchSuggestionsApi _api;

  // Admin CRUD
  Future<NetworkResponse<SearchSuggestionResponse>> createSearchSuggestionAdmin(
    SearchSuggestionInput create,
  ) => _api.createSearchSuggestionAdmin(create);

  Future<NetworkResponse<ListResponse<SearchSuggestionResponse>>>
  getSearchSuggestionsAdmin({
    int offset = 0,
    int limit = 100,
    String? languageCode,
    bool? isActive,
    bool? isHomePage,
    bool? isSearchPage,
  }) => _api.getSearchSuggestionsAdmin(
    offset: offset,
    limit: limit,
    languageCode: languageCode,
    isActive: isActive,
    isHomePage: isHomePage,
    isSearchPage: isSearchPage,
  );

  Future<NetworkResponse<SearchSuggestionResponse>> getSearchSuggestionAdmin(
    int id,
  ) => _api.getSearchSuggestionAdmin(id);

  Future<NetworkResponse<SearchSuggestionResponse>> updateSearchSuggestionAdmin(
    int id,
    SearchSuggestionUpdate update,
  ) => _api.updateSearchSuggestionAdmin(id, update);

  Future<NetworkResponse<void>> deleteSearchSuggestionAdmin(int id) =>
      _api.deleteSearchSuggestionAdmin(id);

  // Public API
  Future<NetworkResponse<ListResponse<SearchSuggestionResponse>>>
  getSearchSuggestions({required String languageCode}) =>
      _api.getSearchSuggestions(languageCode: languageCode);
}
