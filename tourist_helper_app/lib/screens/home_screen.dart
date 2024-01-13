// lib/screens/home_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'authentication_screen.dart';
import 'location_screen.dart';
import 'feedback_screen.dart';
import 'qa_screen.dart';
import 'place_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> _backgroundImages = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Set up a timer to automatically change the background image every 4 seconds
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _backgroundImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourist Helper App'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImages[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthenticationScreen()),
                      );
                    },
                    child: Text('Authentication'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen()),
                      );
                    },
                    child: Text('Location'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackScreen()),
                      );
                    },
                    child: Text('Feedback'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QAScreen()),
                      );
                    },
                    child: Text('Q&A'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlaceScreen()),
                      );
                    },
                    child: Text('Place'),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _backgroundImages.length,
      ),
    );
  }
}
