import 'package:flutter/material.dart';
import 'package:feast/models/category.dart';
import 'package:feast/models/restraunt.dart';
import 'package:feast/widgets/restaurantCard.dart';

class RestaurantFilter extends StatelessWidget {
  final Category category;
  final List<Restaurant> restaurants;

  RestaurantFilter(
      {Key? key, required this.category, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Define a list of tags that should be considered under "Drinks."
    List<String> drinksTags = ['Juice', 'shakes', 'coffee', 'Tea'];

    return Scaffold(
      backgroundColor: Color(0xffD1512D),
      appBar: AppBar(
        title: Text(
          '${category.name}',
          style: TextStyle(
            fontFamily: "Space Grotesk",
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent.withOpacity(0.0),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.02),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                final matchingTags = restaurant.tags
                    .map((tag) => tag.toLowerCase().trim())
                    .toList();

                if (matchingTags.contains(category.name.toLowerCase().trim()) ||
                    (category.name.toLowerCase() == 'drinks' &&
                        matchingTags.any((tag) => drinksTags.contains(tag))) ||
                    (category.name.toLowerCase() == 'desserts' &&
                        matchingTags.contains('ice-cream'))) {
                  return RestaurantCard(restaurant: restaurant);
                } else {
                  return Container();
                }
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                category.imageUrl,
                width: width * 0.4,
                height: height * 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
