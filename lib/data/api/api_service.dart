import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_review_model.dart';
import '../models/restaurants_detail_model.dart';
import '../models/restaurants_list_model.dart';
import '../models/restaurants_search_model.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  static const String baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantListResult> getRestaurantList() async {
    final response = await client.get(Uri.parse('$baseUrl/list'));
    if (response.statusCode == 200) {
      return RestaurantListResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantDetailResult> getRestaurantDetail(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/detail/$id'));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantSearchResult> getRestaurantSearch(String query) async {
    final response = await client.get(Uri.parse('$baseUrl/search?q=$query'));
    if (response.statusCode == 200) {
      return RestaurantSearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<PostReviewResult> postReview({
    required String id,
    required String name,
    required String review,
  }) async {
    final response = await client.post(
      Uri.parse('$baseUrl/review'),
      body: jsonEncode(<String, String>{
        'id': id,
        'name': name,
        'review': review,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      return PostReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed post data');
    }
  }
}
