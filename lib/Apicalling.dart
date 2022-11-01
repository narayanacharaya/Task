import 'dart:convert';

import 'ModelClasses/WeatherData.dart';
import 'package:http/http.dart' as http;

class ApiCalling {
  static Future<WeatherData> getForecast(String city) async {
    try {
      String api =
          'https://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=$city';

      final response = await http.get(Uri.parse(api));
      print(response.body);
      final json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<WeatherData> getForecastByLan(String lan, String lang) async {
    try {
      String api =
          'https://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=$lan,$lang';

      final response = await http.get(Uri.parse(api));
      print(response.body);
      final json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
