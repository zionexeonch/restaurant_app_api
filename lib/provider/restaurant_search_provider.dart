import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/models/restaurants_search_model.dart';
import '../data/enum/result_state.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({required this.apiService});

  late RestaurantSearchResult _restaurantSearchResult;
  RestaurantSearchResult get result => _restaurantSearchResult;

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> fetchSearchRestaurant(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurantSearch = await apiService.getRestaurantSearch(query);
      if (restaurantSearch.founded == 0 &&
          restaurantSearch.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        _message = 'Pencarian Tidak Ditemukan';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        _restaurantSearchResult = restaurantSearch;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error --> $e';
    }
  }
}
