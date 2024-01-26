import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/enum/result_state.dart';
import '../provider/restaurant_search_provider.dart';
import '../widgets/card_restaurant.dart';
import '../widgets/loading_progress.dart';
import '../widgets/text_message.dart';

class RestaurantSearchPage extends StatelessWidget {
  static const String routeName = '/restaurant_search';

  const RestaurantSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Pencarian'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: InputBorder.none,
                hintText: 'Cari berdasarkan nama restoran',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              onSubmitted: (query) {
                if (query != '') {
                  Provider.of<RestaurantSearchProvider>(
                    context,
                    listen: false,
                  ).fetchSearchRestaurant(query);
                }
              },
            ),
          ),
          Expanded(
            child: Consumer<RestaurantSearchProvider>(
              builder: (_, provider, __) {
                switch (provider.state) {
                  case ResultState.loading:
                    return const LoadingProgress();
                  case ResultState.hasData:
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: provider.result.restaurants.length,
                      itemBuilder: (_, index) {
                        final restaurant = provider.result.restaurants[index];
                        return CardRestaurant(restaurant: restaurant);
                      },
                    );
                  case ResultState.noData:
                    return const TextMessage(
                      image: 'assets/images/not-found.png',
                      message: 'Oopss... Pencarian tidak ditemukan',
                    );
                  case ResultState.error:
                    return const TextMessage(
                      image: 'assets/images/no-internet.png',
                      message: 'Koneksi Terputus',
                    );
                  default:
                    return const TextMessage(
                      image: 'assets/images/search-restaurant.png',
                      message: 'Silahkan lakukan pencarian...',
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
