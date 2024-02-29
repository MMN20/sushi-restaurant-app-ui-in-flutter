import 'package:flutter/material.dart';
import 'package:my_sushi_restaurant/screens/cart_screen.dart';
import 'package:my_sushi_restaurant/screens/food_details_screen.dart';
import 'package:my_sushi_restaurant/screens/home_screen.dart';
import 'package:my_sushi_restaurant/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 94, 12, 22)),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
