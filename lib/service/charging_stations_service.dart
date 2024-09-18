import 'package:chargingpoint/models/charging_station.dart';
import 'package:chargingpoint/providers/charging_stations_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';  // For location fetching

class ChargingStationsService {
  final Dio dio = Dio();

  Future<void> fetchChargingStations(BuildContext context) async {
    // Load the API key from .env
    final String apiKey =
        dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'YOUR_DEFAULT_API_KEY';

    try {
      // Fetch current location using Geolocator
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Construct the URL with the current location
      final String url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
          'keyword=ev&location=$latitude,$longitude&radius=500&type=chargingstation&key=$apiKey';

      // Make the API request
      final Response response = await dio.get(url);

      final List<dynamic> result = response.data["results"];

      List<ChargingStation> chargingStations = [];

      for (var station in result) {
        ChargingStation chargingStation = ChargingStation(
          lat: station["geometry"]["location"]["lat"],
          lng: station["geometry"]["location"]["lng"],
          placeId: station["place_id"],
        );

        chargingStations.add(chargingStation);
      }

      // Update the provider with fetched stations
      if (context.mounted) {
        Provider.of<ChargingStationsProvider>(context, listen: false)
            .setEvStations(chargingStations);
      }

      debugPrint('successful - fetchChargingStations');
    } on DioException catch (error) {
      debugPrint("error - fetchChargingStations - DioException - $error");
    } catch (error) {
      debugPrint("error - fetchChargingStations - $error");
    }
  }
}