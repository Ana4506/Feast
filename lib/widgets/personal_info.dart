import 'package:flutter/material.dart';
import 'package:feast/screens/edit_personal_info.dart';

class PersonalInfo extends StatelessWidget {
  String name = 'Ananya';
  String email = 'i luv food';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child:
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                  backgroundColor: Color(0xffFFC6AE),
                  backgroundImage: AssetImage(
                      'assets/ananya.HEIC'), // Replace with your image asset
                  radius: 50,
                ),
                title: Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                trailing: ElevatedButton(child: Text('Edit',
                style: TextStyle(color: Colors.orange,fontSize: 20, decoration: TextDecoration.underline, backgroundColor: Colors.white ),), onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPersonalInfo()),
                  );
                }, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
                )),
                

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
                      buildProfileDetail("Full Name", "Ananya Gupta",
                          Icons.person_2_rounded, Colors.orange),
                      buildProfileDetail("Email", "hello@blabla.com",
                          Icons.email_rounded, Colors.purple),
                      buildProfileDetail("Phone Number", "+91 9289034777",
                          Icons.phone_android_rounded, Colors.blue),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget buildProfileDetail(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}
