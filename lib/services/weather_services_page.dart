import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '13c557c568e34dd5b56171605230406';
  Future<WeatherModel?> getServices({required String cityName}) async {
    WeatherModel? weather;
    try {
      final response = await Dio()
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      Map<String, dynamic> data = response.data;

      weather = WeatherModel.fromjson(data);
    } on Exception catch (e) {
      print(e);
    }
    return weather;
  }
}
