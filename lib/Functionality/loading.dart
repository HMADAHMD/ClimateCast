import 'package:climatecast/Functionality/Weather.dart';
import 'package:climatecast/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      Weather myWeather = Weather();
      var weatherData = await myWeather.getLocationWeather();

      Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
        return HomeScreen(
          locationWeather: weatherData,
        );
      })));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadScreen();
  }
}

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.green,
        ),
      )),
    );
  }
}
// Center(
//             child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//                 autocorrect: false,
//                 decoration: const InputDecoration(
//                     hintText: "Enter City Name", border: OutlineInputBorder()),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'please enter a damn value';
//                   }
//                 },
//               ),
//             ),
//             ElevatedButton(onPressed: () {}, child: const Text("Get Weather"))
//           ],
//         )),