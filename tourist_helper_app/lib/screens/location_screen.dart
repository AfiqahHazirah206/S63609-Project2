import 'package:flutter/material.dart';
import 'package:tourist_helper_app/screens/location_detail.dart';

class LocationScreen extends StatelessWidget {
  final List<Map<String, String>> famousLocations = [
    {
      'name': 'Eiffel Tower, Paris',
      'photo': 'assets/eiffel.jpg',
      'country': 'France',
      'cost': 'RM7500',
      'rating': '5',
      'description':
          'The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.',
    },
    {
      'name': 'Statue of Liberty, New York',
      'photo': 'assets/liberty.jpg',
      'country': 'United States',
      'cost': 'RM8000',
      'rating': '4',
      'description':
          'The Statue of Liberty is a symbol of freedom and democracy. Located in New York Harbor, the statue commemorates the United States\' Declaration of Independence and stands as a symbol of freedom and democracy.',
    },
    {
      'name': 'Great Wall of China, Beijing',
      'photo': 'assets/greatwall.jpg',
      'country': 'China',
      'cost': 'RM6000',
      'rating': '5',
      'description':
          'The Great Wall of China is a series of fortifications built to protect the northern borders of the Chinese Empire. It is one of the most famous walls in the world and a UNESCO World Heritage Site.',
    },
    {
      'name': 'Taj Mahal, Agra',
      'photo': 'assets/tmahal.jpg',
      'country': 'India',
      'cost': 'RM2500',
      'rating': '5',
      'description':
          'The Taj Mahal is a white marble mausoleum built by the Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal. It is considered one of the most beautiful buildings in the world.',
    },
    {
      'name': 'Sydney Opera House, Sydney',
      'photo': 'assets/opera.jpg',
      'country': 'Australia',
      'cost': 'RM7000',
      'rating': '4',
      'description':
          'The Sydney Opera House is a multi-venue performing arts center in Sydney, Australia. It is one of the most famous and distinctive buildings in the world and a UNESCO World Heritage Site.',
    },
    {
      'name': 'Forbidden City, Beijing',
      'photo': 'assets/forbiddencity.jpg',
      'country': 'China',
      'cost': 'RM5000',
      'rating': '4',
      'description':
          'The Forbidden City is a palace complex in Beijing, China. It served as the home of Chinese emperors for almost 500 years and is a symbol of traditional Chinese palatial architecture.',
    },
    {
      'name': 'Mount Fuji, Japan',
      'photo': 'assets/fuji.jpg',
      'country': 'Japan',
      'cost': 'RM2800',
      'rating': '5',
      'description':
          'Mount Fuji is Japan\'s highest mountain and an iconic symbol of the country. It is an active stratovolcano that attracts climbers, tourists, and artists from around the world.',
    },
    {
      'name': 'Himeji Castle, Japan',
      'photo': 'assets/himeji.jpg',
      'country': 'Japan',
      'cost': 'RM3500',
      'rating': '4',
      'description':
          'Himeji Castle is a hilltop Japanese castle complex in Himeji, Japan. It is regarded as one of the finest surviving examples of prototypical Japanese castle architecture.',
    },
    {
      'name': 'Seoul Tower, Seoul',
      'photo': 'assets/namsan.jpg',
      'country': 'South Korea',
      'cost': 'RM2500',
      'rating': '4',
      'description':
          'Seoul Tower, also known as Namsan Tower, is a communication and observation tower located on Namsan Mountain in central Seoul, South Korea.',
    },
    {
      'name': 'Jeju Island, South Korea',
      'photo': 'assets/jeju.jpg',
      'country': 'South Korea',
      'cost': 'RM4500',
      'rating': '5',
      'description':
          'Jeju Island is a volcanic island in South Korea. It is known for its natural beauty, unique lava tubes, waterfalls, and the iconic Hallasan Mountain.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Famous Tourist Locations'),
      ),
      body: ListView.builder(
        itemCount: famousLocations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(famousLocations[index]['name']!),
            leading: CircleAvatar(
              backgroundImage: AssetImage(famousLocations[index]['photo']!),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => LocationDetailDialog(
                    locationDetails: famousLocations[index]),
              );
            },
          );
        },
      ),
    );
  }
}
