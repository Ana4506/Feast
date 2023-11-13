import 'dart:convert';

import 'package:feast/widgets/itemReview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemReview {
  // Define the properties of a shop item, adjust as needed

  final int rating;
  final String review;

  ItemReview({
    required this.rating,
    required this.review,
  });
}

class ItemReviewScreen extends StatefulWidget {
  final int shopId;
  final int itemId;
  final String name;
  const ItemReviewScreen({
    super.key,
    required this.name,
    required this.shopId,
    required this.itemId,
  });

  @override
  State<ItemReviewScreen> createState() => _ItemReviewScreenState();
}

class _ItemReviewScreenState extends State<ItemReviewScreen> {
  List<dynamic> reviewsData = [];
  List<ItemReview> itemReviews = [];
  @override
  void initState() {
    super.initState();
    fetchItemReviews();
  }

  Future<void> fetchItemReviews() async {
    final shopId = widget.shopId;
    final itemId = widget.itemId; // replace with actual item id

    final url = "http://10.0.2.2:8000/reviews/$shopId/$itemId";
    final uri = Uri.parse(url);
    print(uri);
    try {
      final response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        print('working');
        final body = response.body;
        final json = jsonDecode(body);

        setState(() {
          reviewsData = json;
        });

        itemReviews = reviewsData.map((review) {
          return ItemReview(
            rating: review['rating'],
            review: review['comment'],
          );
        }).toList();
      } else {
        print('Failed to load item reviews');
      }
    } catch (error) {
      print('Error fetching item reviews: $error');
    }
  }

      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name + ' Reviews'),
          // colour
          backgroundColor: Color(0xFFD1512D),
        ),
        body: ListView.builder(
          itemCount: itemReviews.length,
          itemBuilder: (context, index) {
            final itemReview = itemReviews[index];
            return ItemReviewCard(
              review: itemReview.review,
              rating: itemReview.rating,
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/addReview',
                arguments: {'shopId': widget.shopId, 'itemId': widget.itemId});
          },
          backgroundColor: Color(0xFFD1512D),
          label: Text('Add Review'),
        ));
  }
}
