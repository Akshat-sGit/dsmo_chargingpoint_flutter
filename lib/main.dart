
import 'package:chargingpoint/pages/dashboard.dart';
import 'package:chargingpoint/providers/charging_stations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await _checkLocationPermission();
  runApp(const MyApp());
}

Future<void> _checkLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    throw Error();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChargingStationsProvider()),
        // Add more providers here if needed
      ],
      child: MaterialApp(
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFCC323F),
          ),
        ),
        home: const Dashboard(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
