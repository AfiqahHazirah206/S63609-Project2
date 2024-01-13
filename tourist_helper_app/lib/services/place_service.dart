// lib/services/place_service.dart
import 'package:tourist_helper_app/models/place.dart';
import 'package:tourist_helper_app/services/api_service.dart';

class PlaceService {
  final ApiService api; // Assuming you have an ApiService class

  PlaceService(this.api);

  Future<List<Place>> getAllPlaces() async {
    // Implement logic to fetch all places from the server
    List<Place> places = await api.fetchAllPlaces();
    return places;
  }

  Future<bool> addPlace(Place place) async {
    // Implement logic to add a new place to the server
    // Return true for successful addition, false otherwise
    bool success = await api.addPlace(place);
    return success;
  }

  Future<bool> deletePlace(Place place) async {
    // Implement logic to delete a place from the server
    // Return true for successful deletion, false otherwise
    bool success = await api.deletePlace(place);
    return success;
  }
}
