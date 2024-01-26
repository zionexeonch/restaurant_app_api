import 'restaurants_list_model.dart';

class RestaurantSearchResult {
  RestaurantSearchResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory RestaurantSearchResult.fromJson(Map<String, dynamic> json) =>
      RestaurantSearchResult(
        error: json["error"] as bool,
        founded: json["founded"] as int,
        restaurants: (json["restaurants"] as List<dynamic>)
            .map((x) => Restaurant.fromJson(x as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
