import 'dart:convert';
import 'package:feast/models/restraunt.dart';
import 'package:feast/widgets/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartItem {
  final int itemId;
  final String itemName;
  final double itemPrice;
  final int quantity;

  CartItem({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });
}

class ShopItem {
  // Define the properties of a shop item, adjust as needed
  final int item_id;
  final String name_item;
  final double price;
  final int shop_id;
  final double rating;
  final String vegornonveg;

  ShopItem({
    required this.item_id,
    required this.name_item,
    required this.price,
    required this.shop_id,
    required this.rating,
    required this.vegornonveg,
  });
}

class RestaurantDetailPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  List<dynamic> itemsData = [];
  List<ShopItem> shopItems = [];

  @override
  void initState() {
    super.initState();
    fetchShopItems();
  }

  Future<void> fetchShopItems() async {
    final shopId = widget.restaurant.id;

    final url = "http://10.0.2.2:8000/available-items/$shopId";
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        setState(() {
          itemsData = json;
        });

        shopItems = itemsData.map((item) {
          return ShopItem(
            item_id: item['item_id'],
            name_item: item['name'],
            price: item['price'],
            shop_id: item['shop_id'],
            rating: item['item_rating'],
            vegornonveg: item['veg_or_nonveg'],
          );
        }).toList();
      } else {
        print('Failed to load shop items');
      }
    } catch (error) {
      print('Error fetching shop items: $error');
    }
  }
  //failed to load shop items

  List<CartItem> cartItems = [];
  Map<int, CartItem> cartItemsMap = {};

  void addToCart(ShopItem shopItem) {
    // if (cartItemsMap.containsKey(widget.itemId)) {
    //     cartItemsMap[widget.itemId]!.quantity++;
    //   } else {
    //     cartItemsMap[widget.itemId] = CartItem(
    //       itemId: widget.itemId,
    //       name: widget.name,
    //       price: widget.price,
    //     );
    //   }
    //   setState(() {});
    // Check if the item is already in the cart
    int existingIndex =
        cartItems.indexWhere((item) => item.itemId == shopItem.item_id);

    setState(() {
      if (existingIndex != -1) {
        // If the item is already in the cart, update its quantity
        cartItems[existingIndex] = CartItem(
          itemId: shopItem.item_id,
          itemName: shopItem.name_item,
          itemPrice: shopItem.price,
          quantity: cartItems[existingIndex].quantity + 1,
        );
      } else {
        // If the item is not in the cart, add it
        cartItems.add(CartItem(
          itemId: shopItem.item_id,
          itemName: shopItem.name_item,
          itemPrice: shopItem.price,
          quantity: 1,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              height: height * 0.3,
              width: width * 0.9,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(widget.restaurant.imageUrl,
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: CircleAvatar(
                      maxRadius: height * 0.03,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      widget.restaurant.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.006,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      widget.restaurant.avg_rating.toString(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      '(30+ ratings)',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.17,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Show Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.006,
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: shopItems.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        itemId: shopItems[index].item_id,
                        name: shopItems[index].name_item,
                        price: shopItems[index].price,
                        rating: 3.7,
                        shopId: widget.restaurant.id,
                        vegornonveg: shopItems[index].vegornonveg,
                        onAddToCart: (ShopItem) {
                          addToCart(shopItems[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \Rs ${calculateTotal()}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD1512D),
                ),
                onPressed: () {
                  // Handle the checkout action
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //color
        backgroundColor: Color(0xFFD1512D),
        onPressed: () {
          // Navigate to the shopping cart page or show a dialog
        },
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  double calculateTotal() {
    // Calculate the total price of items in the cart
    double total = 0.0;
    for (CartItem item in cartItems) {
      total += item.itemPrice * item.quantity;
    }
    return total;
  }
}
