import 'package:flutter/material.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample user data
    final List<String> apps = [
      'Technical Details', 'Station Details', 'BMS'
    ]; 

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
                    child: ListView.builder(
                      itemCount: apps.length, 
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white.withOpacity(0.85),
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              apps[index],
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.green,
                            ),
                          ),
                        );
                      },
                    )
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