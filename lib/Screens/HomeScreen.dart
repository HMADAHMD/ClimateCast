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
      body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 70, 5, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: 60,
                child: TextButton(
                    onPressed: () async {
                      var weatherInfo = await weatherinfo.getLocationWeather();
                      updateUI(weatherInfo);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 35,
                      color: Colors.black,
                    )),
              ),
              Container(
                height: 60,
                width: 200,
                child: const Center(
                  child: Text(
                    "Climkast",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                child: Center(
                  child: IconButton(
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
                        size: 35,
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 234, 242, 254),
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
