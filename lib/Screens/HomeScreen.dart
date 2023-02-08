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
  var mainn;
  var humidity;
  var high;
  var low;

  @override
  void initState() {
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];
      mainn = weatherData['weather'][0]['main'];
      var humid = weatherData['main']['humidity'];
      humidity = humid.toInt();
      var hig_h = weatherData['main']['temp_min'];
      high = hig_h.toInt();
      var lo_w = weatherData['main']['temp_min'];
      low = lo_w.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: Color.fromARGB(255, 228, 243, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: TextButton(
                            onPressed: () async {
                              var weatherInfo =
                                  await weatherinfo.getLocationWeather();
                              updateUI(weatherInfo);
                            },
                            child: const Icon(
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

                                var weatherInfo = await weatherinfo
                                    .getCityWeather(searchedCity);
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
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 70),
                  child: Column(
                    children: [
                      Text('$cityName', style: TextStyle(fontSize: 30)),
                      Text(
                        '$temperature°',
                        style: TextStyle(fontSize: 110),
                      ),
                      Text(
                        '$mainn',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('Humidity: $humidity',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('H:$high'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('L:$low')
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
