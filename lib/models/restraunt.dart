
import 'package:equatable/equatable.dart';
import 'category.dart';
import 'menu_item.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> tags;
  final List<MenuItem> menuItems;
  
  final String avg_rating; 
  // final List<Category> categories;
  // final List<Product> products;
  // final List<OpeningHours> openingHours;
  // final String priceCategory;
  // final Place address;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.menuItems,
    
    required this.avg_rating,

    // required this.categories,
    // required this.products,
    // required this.openingHours,
    // required this.address,
    // this.priceCategory = '\$',
  });
  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        description,
        tags,
        avg_rating,
        // categories,
        // products,
        // openingHours,

        // priceCategory,
        // address,
      ];

  // factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
  //   return Restaurant(
  //     id: snap.id,
  //     name: snap['name'],
  //     imageUrl: snap['imageUrl'],
  //     description: snap['description'],
  //     tags: (snap['tags'] as List).map(
  //       (tag) {
  //         return tag as String;
  //       },
  //     ).toList(),
  //     categories: (snap['categories'] as List).map(
  //       (category) {
  //         return Category.fromSnapshot(category);
  //       },
  //     ).toList(),
  //     products: (snap['products'] as List).map(
  //       (product) {
  //         return Product.fromSnapshot(product);
  //       },
  //     ).toList(),
  //     openingHours: (snap['openingHours'] as List).map(
  //       (openingHour) {
  //         return OpeningHours.fromSnapshot(openingHour);
  //       },
  //     ).toList(),
  //     address: Place.fromJson(snap['address']),
  //   );
  // }
  // static List<Restaurant> restaurants = [
  //   Restaurant(
  //     id: 1,
  //     name: 'Swad Kathi Roll',
  //     description: 'description',
  //     imageUrl: 'assets/rest.png',
  //     tags: const ['Pizza', 'Rolls', 'Fries', 'Chaap'],
  //     menuItems: MenuItem.menuItems
  //         .where((menuItem) => menuItem.restaurantId == 1)
  //         .toList(),
  //   ),
  //   Restaurant(
  //     id: 2,
  //     name: 'Surya Tuck Shop',
  //     description: 'description',
  //     imageUrl: 'assets/rest.png',
  //     tags: ['Burger', 'Patties', 'ice-cream', 'Samosa', 'Wraps'],
  //     menuItems: MenuItem.menuItems
  //         .where((menuItem) => menuItem.restaurantId == 2)
  //         .toList(),
  //   ),
  //   Restaurant(
  //     id: 3,
  //     name: 'Rama Enterprises',
  //     description: 'description',
  //     imageUrl: 'assets/rest.png',
  //     tags: ['Shakes', 'Juices', 'Momos', 'Sandwiches'],
  //     menuItems: MenuItem.menuItems
  //         .where((menuItem) => menuItem.restaurantId == 3)
  //         .toList(),
  //   ),
  //   Restaurant(
  //     id: 4,
  //     name: 'Naveen Chai',
  //     description: 'description',
  //     imageUrl: 'assets/rest.png',
  //     tags: ['Chai', 'Coffee', 'Kesar Milk', 'Maggi'],
  //     menuItems: MenuItem.menuItems
  //         .where((menuItem) => menuItem.restaurantId == 4)
  //         .toList(),
  //   ),
  //   Restaurant(
  //     id: 5,
  //     name: 'Quench',
  //     description: 'description',
  //     imageUrl: 'assets/rest.png',
  //     tags: ['Pizza', 'Burger', 'Wraps', 'Choley Bhature'],
  //     menuItems: MenuItem.menuItems
  //         .where((menuItem) => menuItem.restaurantId == 5)
  //         .toList(),
  //   ),
  // ];
}
