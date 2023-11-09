import 'package:feast/models/restraunt.dart';
import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(restaurant.imageUrl),
            // Add more widgets to display the restaurant's menu and details.
          ],
        ),
      ),
    );
  }
}
