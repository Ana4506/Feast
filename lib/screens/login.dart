import 'dart:convert';

import 'package:feast/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:feast/screens/homescreen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Future<bool> validateUser(String name, String password) async {
    // Define the base URL for your API
    final baseUrl = "http://10.0.2.2:8000/users/validate/$name/$password";

    try {
      // Send the GET request
      final response = await http.get(Uri.parse(baseUrl));

      // Handle the response based on the status code
      if (response.statusCode == 200) {
        // User validated successfully
        print('User validated successfully');
        return true;
      } else if (response.statusCode == 401) {
        // Unauthorized: Invalid name or password
        print('Unauthorized: Invalid name or password');
      } else {
        // Other status codes: Failed to validate user
        print(
            'Failed to validate user with status code: ${response.statusCode}');
      }
      return false;
    } catch (error) {
      // Log error and return false
      print('Error validating user: $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 225, 154, 154)
              // image: DecorationImage(
              //   image: AssetImage('assets/burger.jpeg'),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      const Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 32,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFA4A0C),
                          letterSpacing: -0.64,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      const Text(
                        'Login into your ERP below',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFA4A0C),
                          letterSpacing: -0.32,
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Set the focused border color to white
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Set the enabled (unfocused) border color to white
                          ),
                          labelText: 'SNU Email ID',
                          hintText: 'Enter valid email id as netid@snu.edu.in',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.28,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Set the focused border color to white
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Set the enabled (unfocused) border color to white
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your SNU id password',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.28,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          obscureText: !_passwordVisible,
                          obscuringCharacter: '●',
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFFFA4A0C))),
                      SizedBox(height: height * 0.35),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                            bool isValid = await validateUser(
                                _emailController.text,
                                _passwordController.text);
                            if (isValid) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Invalid email or password'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                           
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFA4A0C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                            minimumSize: Size(width * 0.4, height * 0.08),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      //sign up text which redirects to sign up page
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Don\'t have an account? Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFA4A0C),
                              letterSpacing: -0.32,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Add your Forgot Password logic here
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFA4A0C),
                              letterSpacing: -0.32,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
