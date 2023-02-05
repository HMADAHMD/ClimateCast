import 'package:geolocator/geolocator.dart';

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
    } catch (e) {
      print(e);
    }
  }
}
