import 'package:flutter/material.dart';
import 'package:editable_image/editable_image.dart';
import 'dart:io';

class EditPersonalInfo extends StatefulWidget {
  @override
  _EditPersonalInfoState createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  File? _profilePicFile;
  String name = 'Ananya';
  String email = 'i luv food';

  Future<void> _directUpdateImage(File? file) async {
    if (file == null) return;

    setState(() {
      _profilePicFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Personal Info'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: EditableImage(
                    // Define the method that will run on
                    // the change process of the image.
                    onChange: _directUpdateImage,

                    // Define the source of the image.
                    image: _profilePicFile != null
                        ? Image.file(_profilePicFile!, fit: BoxFit.cover)
                        : null,

                    // Define the size of EditableImage.
                    size: 150,

                    // Define the Theme of image picker.
                    imagePickerTheme: ThemeData(
                      // Define the default brightness and colors.
                      primaryColor: Colors.white,
                      shadowColor: Colors.transparent,
                      colorScheme:
                          const ColorScheme.light(background: Colors.white70),
                      iconTheme: const IconThemeData(color: Colors.black87),

                      // Define the default font family.
                      fontFamily: 'Georgia',
                    ),

                    // Define the border of the image if needed.
                    imageBorder: Border.all(color: Colors.black87, width: 2),

                    // Define the border of the icon if needed.
                    editIconBorder: Border.all(color: Colors.black87, width: 2),
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
                  trailing: ElevatedButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // Implement photo change logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 0,
                    ),
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
