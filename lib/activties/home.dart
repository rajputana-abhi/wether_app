// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather/activties/loading.dart';
import 'package:weather/activties/location.dart';
import 'package:weather/workers/worker.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatelessWidget {
  late String temp, hum, air_speed, des, main, location;

  Home(
      {required this.temp,
      required this.hum,
      required this.air_speed,
      required this.des,
      required this.location});

  // worker instance = worker(loction: "mumbai");
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    var color = [Colors.blue[800], Colors.blue[300]];
    var City_Name = ["Mumbai", "Chennai", "Dhar", "Indore"];
    final _random = new Random();
    var city = City_Name[_random.nextInt(City_Name.length)];

    // Map info = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromWidth(0),
      //     child: AppBar(
      //       backgroundColor: Colors.blue.shade400,
      //     )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade500, Colors.blue.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(children: [
                  Expanded(
                      child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                        hintText: "Search $city", border: InputBorder.none),
                  )),
                  Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loading(search.text)));
                        },
                        child: Icon(
                          Icons.search,
                        ),
                      )),
                ]),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(30),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Image.network("https://openweather.org/img/wn/$icon@2x.png"),
                          Image.asset(
                            "assest/images/weather.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Scattered coludy",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text("$location",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      margin:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.thermostat,
                                size: 50,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${temp}",
                                style: TextStyle(
                                    fontSize: 75, fontWeight: FontWeight.bold),
                              ),
                              Text("C",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.air_outlined,
                                size: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$air_speed",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text("Km/hr",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                WeatherIcons.humidity,
                                size: 30,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$hum",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                              Text("%",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Made by Abhi Tomar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "❤️India❤️",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
