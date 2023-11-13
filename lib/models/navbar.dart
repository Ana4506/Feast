import 'package:flutter/material.dart';
import '../screens/homescreen.dart';
import '../screens/profile.dart';
import '../screens/my_orders.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_rounded),
          label: 'My Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red, // Change this to your preferred color
      onTap: (index) {
        onItemTapped(index); // Call the provided callback

        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyOrders()),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        }
      },
    );
  }
}
