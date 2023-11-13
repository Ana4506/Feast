import 'package:feast/screens/item_review.dart';
import 'package:flutter/material.dart';

class CartItem {
  final int itemId;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.itemId,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class ItemCard extends StatelessWidget {
  final int itemId;
  final String name;
  final double price;
  final double rating;
  final int shopId;
  final String vegornonveg;

  const ItemCard({
    Key? key,
    required this.itemId,
    required this.name,
    required this.price,
    required this.rating,
    required this.shopId,
    required this.vegornonveg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = [];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void addToCart() {
      // Check if the item is already in the cart
      int index = cartItems.indexWhere((item) => item.itemId == itemId);

      if (index != -1) {
        // If item is already in the cart, increase the quantity
        cartItems[index].quantity++;
      } else {
        // If item is not in the cart, add it
        cartItems.add(CartItem(itemId: itemId, name: name, price: price));
      }

      // Calculate total price of items in the cart
      double totalPrice = cartItems.fold(
          0, (total, item) => total + (item.price * item.quantity));

      // Display a snackbar with the updated information
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '$name added to cart. Total Price: Rs ${totalPrice.toStringAsFixed(2)}'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Add veg or non-veg logo based on the property
                      if (vegornonveg == 'Veg')
                        Icon(
                          Icons.eco, // Replace with the actual veg icon
                          color: Colors.green,
                          size: 20,
                        ),
                      if (vegornonveg == 'Nonveg')
                        Icon(
                          Icons
                              .local_dining, // Replace with the actual non-veg icon
                          color: Colors.red,
                          size: 20,
                        ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    //write rupees sign instead of dollar

                    'Rs ${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: height * 0.001),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFD1512D),
                        size: 16,
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemReviewScreen(
                                name: name,
                                itemId: itemId,
                                shopId: shopId,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Show Reviews',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD1512D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width * 0.25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFD1512D),
              ),
              onPressed: () {
                // Add items to cart along with quantity and price
                // Add a snackbar to show that the item has been added to cart
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
