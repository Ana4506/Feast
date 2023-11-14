import 'package:flutter/material.dart';

class ItemReviewCard extends StatelessWidget {
  final String review;
  final int rating;
  final DateTime timestamp; // New timestamp property

  const ItemReviewCard({
    Key? key,
    required this.review,
    required this.rating,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // extract time from datetime timestamp only hour and minute not seconds
    String time = timestamp.hour.toString() + ":" + timestamp.minute.toString();
    //extract date from datetime timestamp
    String date = timestamp.day.toString() +
        "/" +
        timestamp.month.toString() +
        "/" +
        timestamp.year.toString();
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular yellow rating
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: rating > 3
                    ? Colors.green
                    : (rating < 3 ? Colors.red : Colors.yellow),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$rating/5',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            // Expanded widget for the review text and timestamp
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"$review"',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Date: $date, Time: $time', // Dummy date, replace it with the actual timestamp
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
