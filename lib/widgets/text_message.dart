import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  final String image;
  final String message;
  final Function()? onPressed;

  const TextMessage({
    Key? key, // Fix: Replace super.key with key
    required this.image,
    required this.message,
    this.onPressed,
  }) : super(key: key); // Fix: Add super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleLarge, // Fix: Use headline6 instead of titleMedium
          ),
          const SizedBox(height: 8),
          if (onPressed != null)
            ElevatedButton(
              onPressed: onPressed!,
              child: const Text(
                'Refresh',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
