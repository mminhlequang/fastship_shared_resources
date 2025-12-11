import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';

import '../models/models.dart';
import 'models/models.dart';

class _SearchSuggestionsEndpoint {
  _SearchSuggestionsEndpoint._();

  // Admin
  static String adminSearchSuggestions() => "/api/v1/admin/search-suggestions/";
  static String adminSearchSuggestionDetail(int id) =>
      "/api/v1/admin/search-suggestions/$id";

  // Public API (không yêu cầu authentication)
  static String searchSuggestions() => "/api/v1/search-suggestions/";
}

abstract class SearchSuggestionsApi {
  // Admin CRUD
  Future<NetworkResponse<SearchSuggestionResponse>> createSearchSuggestionAdmin(
    SearchSuggestionInput create,
  );
  Future<NetworkResponse<ListResponse<SearchSuggestionResponse>>>
  getSearchSuggestionsAdmin({
    int offset,
    int limit,
    String? languageCode,
    bool? isActive,
    bool? isHomePage,
    bool? isSearchPage,
  });
  Future<NetworkResponse<SearchSuggestionResponse>> getSearchSuggestionAdmin(
    int id,
  );
  Future<NetworkResponse<SearchSuggestionResponse>> updateSearchSuggestionAdmin(
    int id,
    SearchSuggestionUpdate update,
  );
  Future<NetworkResponse<void>> deleteSearchSuggestionAdmin(int id);

  // Public API
  Future<NetworkResponse<ListResponse<SearchSuggestionResponse>>>
  getSearchSuggestions({required String languageCode});
}

class SearchSuggestionsApiImpl extends SearchSuggestionsApi {
  @override
  Future<NetworkResponse<SearchSuggestionResponse>> createSearchSuggestionAdmin(
    SearchSuggestionInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _SearchSuggestionsEndpoint.adminSearchSuggestions(),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => SearchSuggestionResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<SearchSuggestionResponse>>>
  getSearchSuggestionsAdmin({
    int offset = 0,
    int limit = 100,
    String? languageCode,
    bool? isActive,
    bool? isHomePage,
    bool? isSearchPage,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (languageCode != null) params['language_code'] = languageCode;
        if (isActive != null) params['is_active'] = isActive;
        if (isHomePage != null) params['is_home_page'] = isHomePage;
        if (isSearchPage != null) params['is_search_page'] = isSearchPage;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _SearchSuggestionsEndpoint.adminSearchSuggestions(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => SearchSuggestionResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<SearchSuggestionResponse>> getSearchSuggestionAdmin(
    int id,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_SearchSuggestionsEndpoint.adminSearchSuggestionDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => SearchSuggestionResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<SearchSuggestionResponse>> updateSearchSuggestionAdmin(
    int id,
    SearchSuggestionUpdate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _SearchSuggestionsEndpoint.adminSearchSuggestionDetail(id),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => SearchSuggestionResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteSearchSuggestionAdmin(int id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_SearchSuggestionsEndpoint.adminSearchSuggestionDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<SearchSuggestionResponse>>>
  getSearchSuggestions({required String languageCode}) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'language_code': languageCode};

        final response = await AppClient().get(
          _SearchSuggestionsEndpoint.searchSuggestions(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => SearchSuggestionResponse.fromJson(item),
              ),
        );
      },
    );
  }
}
