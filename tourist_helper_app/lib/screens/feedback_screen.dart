import 'package:flutter/material.dart';
import 'package:tourist_helper_app/services/feedback_service.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final FeedbackService feedbackService = FeedbackService();
  Map<String, List<String>> feedbackMap =
      {}; // Map to store feedbacks by category
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Load dummy feedbacks for each category
                loadDummyFeedbacks();
              },
              child: Text('Load Feedbacks'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feedbackMap.length,
                itemBuilder: (context, index) {
                  var category = feedbackMap.keys.elementAt(index);
                  var feedbackList = feedbackMap[category] ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category: $category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: feedbackList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(feedbackList[index]),
                          );
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Show the feedback form as a popup
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Feedback'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: categoryController,
                            decoration: InputDecoration(labelText: 'Category'),
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: feedbackController,
                            decoration: InputDecoration(labelText: 'Feedback'),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Add the feedback to the list
                              addFeedback(
                                categoryController.text,
                                feedbackController.text,
                              );
                              feedbackController.clear();
                              categoryController.clear();
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Add Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  void loadDummyFeedbacks() {
    // Dummy feedbacks for different categories
    feedbackMap = {
      'General': [
        'Amazing place!',
        'Very informative tour',
        'Great experience'
      ],
      'Attractions': [
        'Beautiful scenery',
        'Exciting activities',
        'Must-visit spots'
      ],
      'Services': ['Friendly staff', 'Efficient service', 'Clean facilities'],
    };

    setState(() {});
  }

  void addFeedback(String category, String feedback) {
    // Add the feedback to the map
    if (feedbackMap.containsKey(category)) {
      feedbackMap[category]!.add(feedback);
    } else {
      feedbackMap[category] = [feedback];
    }

    setState(() {});
  }
}
