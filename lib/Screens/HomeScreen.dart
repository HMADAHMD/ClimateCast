import 'package:climatecast/Functionality/Weather.dart';
import 'package:climatecast/Screens/SearchCity.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final locationWeather;
  HomeScreen({this.locationWeather});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var weatherinfo = Weather();
  int? temperature;
  var cityName;
  var lat;
  var long;

  @override
  void initState() {
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      lat = weatherData['coord']['lat'];
      long = weatherData['coord']['lon'];
      cityName = weatherData['name'];
      print("$temperature in $cityName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ClimKast",
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: Color.fromARGB(255, 209, 255, 154),
        actions: [
          IconButton(
              onPressed: () async {
                print("search pressed");
                var searchedCity = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return SearchCity();
                }));

                var weatherInfo =
                    await weatherinfo.getCityWeather(searchedCity);
                updateUI(weatherInfo);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 246, 251, 239),
      body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 254, 236, 234),
                    borderRadius: BorderRadius.circular(10)),
                width: 165,
                height: 250,
                child: Column(
                  children: [
                    Text('$temperature°c', style: TextStyle(fontSize: 40)),
                  ],
                ),
              ),
              SizedBox(
                width: 29,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 254, 234),
                    borderRadius: BorderRadius.circular(10)),
                width: 165,
                height: 250,
                child: Column(
                  children: [
                    Text(
                      '$cityName',
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Lat $lat\nLong $long",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              var weatherInfo = await weatherinfo.getLocationWeather();
              updateUI(weatherInfo);
            },
            child: Text("get current\nlocation"))
      ])),
    );
  }
}

class reusableButton extends StatelessWidget {
  const reusableButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 44, 85, 45),
          ),
          onPressed: () {
            print("button");
          },
          child: const Text(
            "Get location",
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
