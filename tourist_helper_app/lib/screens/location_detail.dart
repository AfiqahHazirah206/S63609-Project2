// lib/dialogs/location_detail.dart
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LocationDetailDialog extends StatelessWidget {
  final Map<String, String> locationDetails;

  LocationDetailDialog({required this.locationDetails});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(locationDetails['name']!),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            locationDetails['photo']!,
            width: 300, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text('Country: ${locationDetails['country']}'),
          Text('Cost for Trip Package (USD): ${locationDetails['cost']}'),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Rating: '),
              RatingBar.builder(
                initialRating: double.parse(locationDetails['rating']!),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // You can use the rating if needed
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Description: ${locationDetails['description']}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
