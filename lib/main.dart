import 'package:feast/models/navbar.dart';
import 'package:feast/screens/search_results.dart';
import 'package:flutter/material.dart';
import 'package:feast/screens/login.dart';
import 'package:feast/screens/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:feast/screens/my_orders.dart";
import "package:feast/screens/profile.dart";
import "package:feast/screens/payment.dart";
import "package:feast/screens/search.dart";
import "package:feast/screens/search_results.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
      ),
      home: LoginScreen(),
    );
  }
}
