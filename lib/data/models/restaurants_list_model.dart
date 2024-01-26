class RestaurantListResult {
  RestaurantListResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  factory RestaurantListResult.fromJson(Map<String, dynamic> json) =>
      RestaurantListResult(
        error: json["error"] ?? false,
        message: json["message"] ?? "",
        count: json["count"] ?? 0,
        restaurants: List<Restaurant>.from(
          (json["restaurants"] as List<dynamic>? ?? [])
              .map((x) => Restaurant.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        pictureId: json["pictureId"] ?? "",
        city: json["city"] ?? "",
        rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
