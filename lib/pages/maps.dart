// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:chargingpoint/providers/charging_stations_provider.dart';
import 'package:chargingpoint/service/charging_stations_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController _googleMapController;
  late CameraPosition _initialCameraPosition;
  bool _isLoading = true;
  Position? _currentPosition;

  final ChargingStationsService chargingStationsService =
      ChargingStationsService();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    chargingStationsService.fetchChargingStations(context);
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      _initialCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 11.5,
      );
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Ensure the scaffold background is transparent
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.green, // Transparent AppBar
        elevation: 0,
        title: Text(
          'Find Charging Station',
          style: GoogleFonts.robotoCondensed(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Consumer<ChargingStationsProvider>(
                  builder: (context, chargingStationsProvider, child) { 
                    List<Marker> markers = List.generate(
                        chargingStationsProvider.getChargingStations.length,
                        (index) {
                      return Marker(
                        // ignore: deprecated_member_use
                        icon: BitmapDescriptor.defaultMarker, 
                        markerId: MarkerId(chargingStationsProvider
                            .getChargingStations[index].placeId),
                        position: LatLng(
                          chargingStationsProvider
                              .getChargingStations[index].lat,
                          chargingStationsProvider
                              .getChargingStations[index].lng,
                        ),
                      );
                    });

                    return GoogleMap(
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: (controller) =>
                          _googleMapController = controller,
                      markers: markers.toSet(),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: _isLoading
          ? null
          : FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition),
              ),
              child: const Icon(Icons.center_focus_strong),
            ),
    );
  }
}
