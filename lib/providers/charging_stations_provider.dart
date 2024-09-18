import 'package:chargingpoint/models/charging_station.dart';
import 'package:flutter/material.dart';


class ChargingStationsProvider extends ChangeNotifier {
  List<ChargingStation> _chargingStations = [];

  void setEvStations(List<ChargingStation> stations) {
    _chargingStations = stations;
    notifyListeners();
  }

  void clearEvStations(List<ChargingStation> stations) {
    _chargingStations = [];
    notifyListeners();
  }

  List<ChargingStation> get getChargingStations => _chargingStations;
}
