import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/models/restaurants_list_model.dart';
import '../data/enum/result_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantListProvider({required this.apiService}) {
    fetchAllRestaurant();
  }

  late RestaurantListResult _restaurantListResult;
  RestaurantListResult get result => _restaurantListResult;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurantList = await apiService.getRestaurantList();
      if (restaurantList.count == 0 && restaurantList.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();

        _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();

        _restaurantListResult = restaurantList;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();

      _message = 'Error --> $e';
    }
  }
}
