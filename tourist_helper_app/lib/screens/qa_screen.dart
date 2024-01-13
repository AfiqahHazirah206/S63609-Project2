// lib/screens/qa/qa_screen.dart

import 'package:flutter/material.dart';
import 'package:tourist_helper_app/services/qa_service.dart';
import 'package:tourist_helper_app/services/api_service.dart';

class QAScreen extends StatelessWidget {
  final QAService qaService = QAService(ApiService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/aeroplane.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<String>>(
          future: qaService
              .getQuestionsAndAnswers(), //may modify this to use dummy data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Replace the actual data with dummy data
              List<String> qaList = [
                "What are the must-visit attractions in the city?",
                "How can I book a guided tour?",
                "What's the best time to visit?",
                "Are there any local customs I should be aware of?",
                // Add more dummy questions as needed
              ];

              return ListView.builder(
                itemCount: qaList.length,
                itemBuilder: (context, index) {
                  // Replace with a model class if needed
                  return ListTile(
                    title: Text(qaList[index]),
                    subtitle: Text("Dummy Answer ${index + 1}"),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
