import 'dart:convert';

import 'package:feast/widgets/itemReview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemReview {
  // Define the properties of a shop item, adjust as needed

  final int rating;
  final String review;
  final DateTime timestamp;

  ItemReview({
    required this.rating,
    required this.review,
    required this.timestamp,
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
    final itemId = widget.itemId;
    final url = "http://10.0.2.2:8000/reviews/$shopId/$itemId";
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        setState(() {
          reviewsData = json;
        });

        itemReviews = reviewsData.map((review) {
          return ItemReview(
            rating: review['rating'],
            review: review['comment'],
            timestamp: DateTime.parse(review['created_at']),
          );
        }).toList();
      } else {
        print('Failed to load item reviews');
      }
    } catch (error) {
      print('Error fetching item reviews: $error');
    }
  }

  Future<void> addReview(String review, double rating) async {
    final shopId = widget.shopId;
    final itemId = widget.itemId;

    final url = "http://10.0.2.2:8000/add-review/$shopId/$itemId";
    final uri = Uri.parse(url);
    print(uri);

    final reviewData = {
      'comment': review,
      'rating': rating,
      'created_at': DateTime.now().toIso8601String(),
      'user_id': 1,
      'shop_id': shopId,
      'item_id': itemId,
    };

    final body = jsonEncode(reviewData);

    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Review added successfully');
      } else {
        print('Failed to add review');
      }
    } catch (error) {
      print('Error adding review: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final reviewController = TextEditingController();
    final ratingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name + ' Reviews'),
        // colour
        backgroundColor: Color(0xFFD1512D),
      ),
      body: itemReviews.length == 0
          ? Center(
              child: Text(
                'No reviews yet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: itemReviews.length,
              itemBuilder: (context, index) {
                final itemReview = itemReviews[index];
                return ItemReviewCard(
                  review: itemReview.review,
                  rating: itemReview.rating,
                  timestamp: itemReview.timestamp,
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Review'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextField(
                          controller: reviewController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Review',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: ratingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Rating',
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Submit'),
                      onPressed: () {
                        final review = reviewController.text;
                        final rating =
                            double.tryParse(ratingController.text) ?? 0.0;
                        addReview(review, rating);
                        Navigator.of(context).pop();
                        //page should automatically refresh afer submitting review
                        fetchItemReviews();
                      },
                    ),
                  ],
                );
              });
        },
        backgroundColor: Color(0xFFD1512D),
        label: Text('Add Review'),
      ),
    );
  }
}
