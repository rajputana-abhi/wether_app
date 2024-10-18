// import 'dart:js_interop';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/activties/home.dart';
import 'package:weather/workers/worker.dart';

class Loading extends StatefulWidget {
  String loc;

  Loading(this.loc);
  @override
  _LoadingState createState() => _LoadingState(loc);
}

class _LoadingState extends State<Loading> {
  // String a = loc?? "null";
  String loc;
  _LoadingState(this.loc);
  late String city = loc;
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  // String? icon;
  void startApp() async {
    worker instance = worker(location: city);
    await instance.getData();
    if (temp == '') {
      temp = "NA";
      air_speed = "NA";
      hum = "NA";
    } else {
      if (temp == "NA") {
      } else {
        temp = ((instance.temp).toString()).substring(0, 5);
        air_speed = ((instance.airspped).toString()).substring(0, 3);
      }
      hum = instance.humidity;
      des = instance.Description;
      main = instance.main;
    }

    // icon = instance.icon;

    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                  temp: temp!,
                  hum: hum!,
                  air_speed: air_speed!,
                  des: des!,
                  location: loc)));
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    startApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assest/images/weather.png",
              height: 240,
              width: 240,
            ),
            Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made By Abhi Tomar",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
