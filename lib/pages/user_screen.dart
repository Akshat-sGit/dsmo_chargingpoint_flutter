import 'dart:ui';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample user data
    final Map<String, String> userDetails = {
      "Name": "Akshat Gupta",
      "Vehicle Number": "UP32 AB 1234",
      "Mobile Number": "+91 9876543210",
      "Mail ID": "akshat@example.com",
      "Aadhaar No": "1234 5678 9123",
      "Emergency Contact": "+91 9876501234",
      "District": "Lucknow",
      "State": "Uttar Pradesh",
    };

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.green,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      weight: 21,
                    ),
                  ),
                  title: const Text(
                    'User Details',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3 , // Adjust for landscape mode
                      childAspectRatio: 3, // Adjust for the height of tiles
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: userDetails.length,
                    itemBuilder: (context, index) {
                      String key = userDetails.keys.elementAt(index);
                      String value = userDetails[key]!;
                      return Card(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                key,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
