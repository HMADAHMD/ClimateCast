import 'package:flutter/material.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Search();
  }
}

class Search extends StatelessWidget {
  //const Search({super.key});

  String? cityName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 228, 247, 228),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "search city",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.clear)),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 227, 255, 229)),
              onPressed: () {
                Navigator.pop(context, cityName);
                print("get weather");
              },
              child: Text(
                "Get Weather",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
