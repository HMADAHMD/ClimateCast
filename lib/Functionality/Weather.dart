import 'Location.dart';
import 'Networking.dart';

const apiKey = "87940f818a9420b66221bc33b39a0611";

class Weather {
  Future getCityWeather(cityName) async {
    Networking myNetworking = Networking("https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey");
    var weatherData = await myNetworking.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getLocation();

    Networking myNetworking = Networking(
        //this is the instance of networking class which gives the api to the url var.
        "https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.Latitude}&lon=${myLocation.Longitude}&units=metric&appid=$apiKey");

    var weatherData = await myNetworking.getData();
    return weatherData;
  }
}
