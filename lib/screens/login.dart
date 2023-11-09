import 'package:flutter/material.dart';
import 'package:feast/screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/burger.jpeg'),
              fit: BoxFit.cover,
            ),
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
                          fontFamily: 'Space Grotesk',
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
                          fontFamily: 'Space Grotesk',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFA4A0C),
                          letterSpacing: -0.32,
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      const TextField(
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
                            fontFamily: 'Space Grotesk',
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
                              fontFamily: 'Space Grotesk',
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
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
                                  fontFamily: 'Space Grotesk',
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
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Add your Forgot Password logic here
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
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
