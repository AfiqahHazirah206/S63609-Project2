// lib/services/feedback_service.dart
import 'package:http/http.dart' as http;

class FeedbackService {
  final String baseUrl =
      'https://example.com/api'; // Replace with your API base URL

  Future<List<String>> getFeedbackByCategory(String category) async {
    final String feedbackUrl =
        '$baseUrl/feedback?category=$category'; // Replace with your feedback API endpoint

    try {
      final response = await http.get(Uri.parse(feedbackUrl));

      if (response.statusCode == 200) {
        // Parse the response and return the feedback list
        List<String> feedbackList = parseFeedbackResponse(response.body);
        return feedbackList;
      } else {
        // Handle other status codes or errors
        throw Exception('Failed to fetch feedback');
      }
    } catch (e) {
      // Handle network or other errors
      throw Exception('Failed to fetch feedback');
    }
  }

  Future<bool> submitFeedback(String category, String feedback) async {
    final String submitUrl =
        '$baseUrl/submit-feedback'; // Replace with your submit feedback API endpoint

    try {
      final response = await http.post(
        Uri.parse(submitUrl),
        body: {'category': category, 'feedback': feedback},
      );

      if (response.statusCode == 201) {
        // Feedback submitted successfully
        return true;
      } else {
        // Handle other status codes or errors
        throw Exception('Failed to submit feedback');
      }
    } catch (e) {
      // Handle network or other errors
      throw Exception('Failed to submit feedback');
    }
  }

  // Helper function to parse feedback response
  List<String> parseFeedbackResponse(String responseBody) {
    // Implement logic to parse the response and extract feedback strings
    return ['Feedback 1', 'Feedback 2', 'Feedback 3'];
  }
}
