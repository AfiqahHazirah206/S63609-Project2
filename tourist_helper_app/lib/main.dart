import 'package:flutter/material.dart';
import 'package:tourist_helper_app/screens/home_screen.dart';

void main() {
  runApp(TouristHelperApp());
}

class TouristHelperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourist Helper App',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Customize the primary color
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
        // You can add more customizations here if needed
      ),
      home: HomeScreen(),
    );
  }
}
