import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void locationGot() async {
    LocationPermission requestPermission;
    requestPermission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  void initState() {
    super.initState();
    locationGot();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Climcast'),
          backgroundColor: Colors.pink,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Get Location"))),
      ),
    );
  }
}
