import 'package:feast/models/category.dart';
import 'package:feast/models/restraunt.dart';
import 'package:flutter/material.dart';
import 'package:feast/widgets/categoryBox.dart';

import '../widgets/restaurantCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Ananya";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: height * 0.05,
                left: width * 0.05,
                right: width * 0.03,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: height * 0.04,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: width * 0.005,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Search for a food or shop...',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Space Grotesk',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/search.png',
                            ),
                            iconSize: 19,
                            onPressed: () {
                              // Perform search action here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: const Color(0xffE23744),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "$userName, What are you craving for today?",
                  style: const TextStyle(
                    fontFamily: "Space Grotesk",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.16,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Category.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryBox(
                          category: Category.categories[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.16,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Category.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryBox(
                          category: Category.categories[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(23, 10, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Restaurants in your campus',
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                    child: Container(
                      height: 1,
                      width: width * 0.55,
                      color: const Color(0xffE23744),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Restaurant.restaurants.length,
              itemBuilder: (context, index) {
                return RestaurantCard(
                  restaurant: Restaurant.restaurants[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
