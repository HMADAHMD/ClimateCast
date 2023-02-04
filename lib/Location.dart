import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Networking.dart';

//87940f818a9420b66221bc33b39a0611  API key

class Location {
  double? Longitude;
  double? Latitude;

  Future getLocation() async {
    try {
      LocationPermission requestPermission;
      requestPermission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      Longitude = position.longitude;
      Latitude = position.latitude;
      print(Longitude);
      print(Latitude);
    } catch (e) {
      print(e);
    }
  }
}
