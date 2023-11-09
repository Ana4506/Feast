import 'package:feast/models/restraunt.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * 0.05, 0, 23, 10),
      child: Card(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: restaurant.tags
                            .map(
                              (tag) => restaurant.tags.indexOf(tag) ==
                                      restaurant.tags.length - 1
                                  ? Text(
                                      tag,
                                    )
                                  : Text(
                                      '$tag, ',
                                    ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(width * 0.005),
                      width: width * 0.1,
                      height: height * 0.025,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xff0EAC00),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: const Center(
                        child: Text(
                          '4.3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Space Grotesk",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
