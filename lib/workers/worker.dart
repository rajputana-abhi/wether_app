import "dart:convert";
// import "dart:html";

import "package:http/http.dart" as http;
import "package:http/http.dart";

class worker {
  String location;

  worker({required this.location}) {
    location = this.location;
  }
  late String temp;
  late String humidity;
  late String airspped;
  late String Description;
  late String main;
  late String icon;

  // get icon => null;
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=e34a5eb0b4c5ff748fdf9219a63d224e"));
      Map data = jsonDecode(response.body);

      print(data);
      //Getting Temp,Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

//Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"] / 0.27777777777778;

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      //Assigning Values
      temp = getTemp.toString(); //C
      humidity = getHumidity; // %
      airspped = getAir_speed.toString(); //km/hr
      Description = getDesc;
      main = getMain_des;
      var icon = weather_main_data["icon"].toString();
    } catch (e) {
      print(e);
      temp = "NA";
      humidity = "Na";
      airspped = "NA";
      Description = "Can't Find Data";
      main = "NA";
      var icon = "03n";
    }
  }
}
