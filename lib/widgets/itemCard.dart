import 'package:feast/screens/item_review.dart';
import 'package:feast/screens/rest_details.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final int itemId;
  final String name;
  final double price;
  final double rating;
  final int shopId;
  final String vegornonveg;
  final Function(ShopItem) onAddToCart;

  const ItemCard({
    Key? key,
    required this.itemId,
    required this.name,
    required this.price,
    required this.rating,
    required this.shopId,
    required this.vegornonveg,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.vegornonveg == 'Veg')
                        Icon(
                          Icons.eco,
                          color: Colors.green,
                          size: 20,
                        ),
                      if (widget.vegornonveg == 'Nonveg')
                        Icon(
                          Icons.local_dining,
                          color: Colors.red,
                          size: 20,
                        ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Rs ${widget.price.toStringAsFixed(2)}',
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
                        //ratings till 1 decimal place
                        widget.rating.toStringAsFixed(1),
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
                                name: widget.name,
                                itemId: widget.itemId,
                                shopId: widget.shopId,
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
                backgroundColor: const Color(0xFFD1512D),
              ),
              onPressed: () {
                widget.onAddToCart(
                  ShopItem(
                    item_id: widget.itemId,
                    name_item: widget.name,
                    price: widget.price,
                    shop_id: widget.shopId,
                    rating: widget.rating,
                    vegornonveg: widget.vegornonveg,
                  ),
                );
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
