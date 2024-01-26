import 'package:flutter/material.dart';

import '../common/styles.dart';
import '../data/models/restaurants_detail_model.dart';
import '../provider/restaurant_detail_provider.dart';
import 'dialog_review.dart';

class BottomSheetReview extends StatelessWidget {
  final RestaurantDetail restaurant;
  final RestaurantDetailProvider provider;

  const BottomSheetReview({
    Key? key, // Fix: Use Key? key instead of super.key
    required this.restaurant,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ElevatedButton.icon(
                    // Fix: Use ElevatedButton.icon instead of IconButton
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    label: const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Review',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: TextButton.icon(
                  // Fix: Use TextButton.icon instead of TextButton
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return DialogReview(
                          provider: provider,
                          restaurantId: restaurant.id,
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'Tambah Review',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 6),
            children: restaurant.customerReviews.map((review) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(review.name),
                      subtitle: Text(review.date),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        review.review,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium! // Fix: Use headline6 instead of titleMedium
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
