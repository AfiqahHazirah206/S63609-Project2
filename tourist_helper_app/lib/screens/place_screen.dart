// lib/screens/place/place_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourist_helper_app/models/place.dart';
import 'package:tourist_helper_app/services/api_service.dart';
import 'package:tourist_helper_app/services/place_service.dart';

class PlaceScreen extends StatefulWidget {
  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final ApiService apiService = ApiService();
  final PlaceService placeService = PlaceService(ApiService());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  Future<void> addPlace(Place newPlace) async {
    final String apiUrl =
        'https://tourist-helper-app-9084e-default-rtdb.asia-southeast1.firebasedatabase.app';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          'name': newPlace.name,
          'location': newPlace.location,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Success
        print('Place added successfully!');
        setState(() {
          // Fetch places from the server and update the UI
          // Example: places = await placeService.getAllPlaces();
        });
      } else {
        // Error
        print('Failed to add place. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add place'),
          ),
        );
      }
    } catch (error) {
      print('Error adding place: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add place: $error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Place Name'),
            ),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                Place newPlace = Place(
                  name: nameController.text,
                  location: locationController.text,
                );

                await addPlace(newPlace);
              },
              child: Text('Add Place'),
            ),
            SizedBox(height: 16.0),
            // Display the list of places here
          ],
        ),
      ),
    );
  }
}
