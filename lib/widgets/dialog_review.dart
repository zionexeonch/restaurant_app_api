import 'package:flutter/material.dart';
import 'package:restaurant_app_api/common/styles.dart';

import '../data/enum/result_state.dart';
import '../provider/restaurant_detail_provider.dart';

class DialogReview extends StatelessWidget {
  final RestaurantDetailProvider provider;
  final String restaurantId;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DialogReview({
    Key? key,
    required this.provider,
    required this.restaurantId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.all(16),
      title: const Text('Tambah Review'),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _reviewController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Review',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Review tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.all(16),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            FormState? form = _formKey.currentState;

            if (form != null) {
              if (form.validate()) {
                provider
                    .postReview(
                  id: restaurantId,
                  name: _nameController.text,
                  review: _reviewController.text,
                )
                    .then((value) {
                  if (value == ResultState.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Berhasil menambahkan review'),
                      ),
                    );
                  }
                  Navigator.pop(context);
                });
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor, // Set the button color
          ),
          child: const Text(
            'Tambah',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
