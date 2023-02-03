import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Climcast'),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  LocationPermission requestPermission;
                  requestPermission = await Geolocator.requestPermission();
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.low);
                  print(position);
                },
                child: const Text("Get Location"))),
      ),
    );
  }
}
