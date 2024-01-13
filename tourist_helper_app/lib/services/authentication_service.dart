// lib/services/authentication_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final String baseUrl =
      'https://csm3103-27f33-default-rtdb.asia-southeast1.firebasedatabase.app';

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.https(baseUrl, '/login.json'), // endpoint for login
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        final Map<String, dynamic> resData = json.decode(response.body);
        // Add your logic to handle the response data if needed
        return resData;
      } else {
        print('Error during login: ${response.statusCode}');
        // Failed login
        return {'error': 'Failed to login'};
      }
    } catch (error) {
      print('Error during login request: $error');
      // Handle network or other errors
      return {'error': 'Network error'};
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.https(baseUrl, '/signup.json'), // endpoint for registration
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      if (response.statusCode == 200) {
        // Successful registration
        final Map<String, dynamic> resData = json.decode(response.body);
        // Add your logic to handle the response data if needed
        return resData;
      } else {
        print('Error during registration: ${response.statusCode}');
        // Failed registration
        return {'error': 'Failed to register'};
      }
    } catch (error) {
      print('Error during registration request: $error');
      // Handle network or other errors
      return {'error': 'Network error'};
    }
  }
}
