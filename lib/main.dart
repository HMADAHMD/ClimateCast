import 'package:climatecast/Location.dart';
import 'package:climatecast/Networking.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = "87940f818a9420b66221bc33b39a0611";
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? longitude;
  double? latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location myLocation = Location();
    await myLocation.getLocation();
    longitude = myLocation.Longitude;
    latitude = myLocation.Latitude;
    Networking myNetworking = Networking(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey");

    var weatherData = await myNetworking.getData();
    var cityname = weatherData['name'];
    var temperature = weatherData['main']['temp'];
    print(temperature);
    print(cityname);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Climate"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Get Location"))
            ],
          ),
        ),
      ),
    );
  }
}
