import 'dart:convert';
import 'package:feast/models/category.dart';
import 'package:feast/models/menu_item.dart';
import 'package:feast/models/navbar.dart';
import 'package:feast/models/restraunt.dart';
import 'package:feast/screens/my_orders.dart';
import 'package:feast/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:feast/widgets/categoryBox.dart';
import 'package:http/http.dart' as http;
import '../widgets/restaurantCard.dart';
import 'package:feast/screens/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const MyOrders(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> restaurantsGautam = [];
  List<Restaurant> r = [];

  void fetchRestaurants() async {
    print('working');
    const url = 'http://10.0.2.2:8000/shops';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print(json);
    setState(() {
      restaurantsGautam = json;
    });

    for (var element in restaurantsGautam) {
      r.add(Restaurant(
        id: element['shop_id'],
        name: element['name'],
        description: element['description'],
        imageUrl: element['image_url'],
        tags: element['tags'].cast<String>(),
        avg_rating: element['avg_rating'],
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList(),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  String userName = "Ananya";
  int _selectedIndex = 0;
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 40, 23, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SearchBar(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    ),
                    constraints:
                        const BoxConstraints(maxWidth: 278, minHeight: 40),
                    controller: _searchController,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                    ),
                    hintText: "Search for shops, dishes...",
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 10)),
                    leading: const Icon(Icons.search,
                        color: Color(0xffFA4A0C), size: 24.0),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart,
                          color: const Color(0xffFA4A0C), size: 24.0)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "$userName, What are you craving today?",
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
                      //fetch all restaurants with the given category tags
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: Category.categories.length,
                        itemBuilder: (context, index) {
                          return CategoryBox(
                            category: Category.categories[index],
                            restaurants: r,
                          );
                        },
                      ),
                    ),
                    // SizedBox(
                    //   height: height * 0.16,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     itemCount: Category.categories.length,
                    //     itemBuilder: (context, index) {
                    //       return CategoryBox(
                    //         category: Category.categories[index],
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                padding: EdgeInsets.only(left: width * 0.042),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.001, vertical: height * 0.005),
                      child: Container(
                        height: height * 0.0005,
                        width: width * 0.55,
                        color: const Color(0xffFA4A0C),
                      ),
                    ),
                  ],
                ),
              ),

              // show cards of all restaurants that we got from the api

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: r.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    restaurant: r[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(
      //       () {
      //         _selectedIndex = index;
      //       },
      //     );
      //   },
      // ),
    );
  }
}
