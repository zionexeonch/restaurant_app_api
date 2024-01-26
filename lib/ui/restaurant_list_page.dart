import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/enum/result_state.dart';
import '../provider/restaurant_list_provider.dart';
import '../widgets/card_restaurant.dart';
import '../widgets/loading_progress.dart';
import '../widgets/text_message.dart';

import 'restaurant_search_page.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildList(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Zestaurant'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, RestaurantSearchPage.routeName);
          },
        ),
      ],
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantListProvider>(
      builder: (context, provider, child) {
        switch (provider.state) {
          case ResultState.loading:
            return const LoadingProgress();
          case ResultState.hasData:
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemCount: provider.result.count,
              itemBuilder: (context, index) {
                final restaurant = provider.result.restaurants[index];
                return CardRestaurant(restaurant: restaurant);
              },
            );
          case ResultState.noData:
            return const TextMessage(
              image: 'assets/images/empty-data.png',
              message: 'Data Kosong',
            );
          case ResultState.error:
            return TextMessage(
              image: 'assets/images/no-internet.png',
              message: 'Koneksi Terputus',
              onPressed: () => provider.fetchAllRestaurant(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
