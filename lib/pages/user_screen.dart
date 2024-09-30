import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample user data
    final Map<String, String> userDetails = {
      "Name": "Namo Jain",
      "Vehicle Number": "UP32 AB 1234",
      "Mobile Number": "+91 9876543210",
      "Mail ID": "akshat@example.com",
      "Aadhaar No": "1234 5678 9123",
      "Emergency Contact": "+91 9876501234",
      "District": "Lucknow",
      "State": "Uttar Pradesh",
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff75A944),
              Color(0xff79AC46),
              Color(0xff599621),
              Color(0xff75A944),
              Color(0xff91B95F),
              Color(0xff669F30),
              Color(0xff3F870B)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width < 600
                            ? 2
                            : 3, // Adjust for landscape mode
                        childAspectRatio: 3, // Adjust for the height of tiles
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: userDetails.length,
                      itemBuilder: (context, index) {
                        String key = userDetails.keys.elementAt(index);
                        String value = userDetails[key]!;
                        return Card(
                          color: Colors.white.withOpacity(0.67),
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
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
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
      ),
    );
  }
}