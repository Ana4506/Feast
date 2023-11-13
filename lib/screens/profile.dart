import 'package:feast/screens/payment.dart';
import 'package:feast/widgets/faqs.dart';
import 'package:feast/widgets/logout.dart';
import 'package:feast/screens/my_orders.dart';
import 'package:feast/widgets/personal_info.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'Ananya';
  String email = 'ag351@snu.edu.in';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Space Grotesk",
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent.withOpacity(0.0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xffFFC6AE),
                  backgroundImage: AssetImage(
                      'assets/ananya.HEIC'), // Replace with your image asset
                  radius: 50,
                ),
                SizedBox(height: height * 0.005),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  width: width * 0.9,
                  padding: EdgeInsets.all(width * 0.03),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F8FA),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      buildProfileItem("Personal Info", Icons.person_2_outlined,
                          () {
                        // Handle navigation to "My Orders" screen
                      }, Colors.orange, PersonalInfo()),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  width: width * 0.9,
                  padding: EdgeInsets.all(width * 0.03),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F8FA),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      buildProfileItem("My Orders", Icons.assignment_rounded,
                          () {
                        // Handle navigation to "My Orders" screen
                      }, Colors.blue, MyOrders()),
                      buildProfileItem("FAQs", Icons.help_outline_sharp, () {
                        // Handle navigation to "FAQs" screen
                      }, Colors.orange, Faqs()),
                      buildProfileItem("Payment Method", Icons.payment, () {
                        // Handle navigation to "Payment Method" screen
                      }, Colors.blue, Payment()),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  width: width * 0.9,
                  padding: EdgeInsets.all(width * 0.03),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F8FA),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      buildProfileItem("Logout", Icons.logout, () {
                        // Handle navigation to "My Orders" screen
                      }, Colors.red, Logout()),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileItem(
    String title,
    IconData icon,
    Function() onTap,
    Color iconColor,
    Widget screen,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
