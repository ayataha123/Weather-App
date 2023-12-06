import 'package:flutter/material.dart';

class WeatherModel {
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date:DateTime.parse( data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  String getImage() {
    if (weatherStateName == "Sunny" || weatherStateName == 'Light cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy cloud' ||
        weatherStateName == "Partly cloudy") {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColorThem() {
    if (weatherStateName == "Sunny" || weatherStateName == 'Light cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy cloud' ||
        weatherStateName == "Partly cloudy") {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.deepPurple;
    } else {
      return Colors.green;
    }
  }
}
