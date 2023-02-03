import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:weather_app_advanced/weather_model.dart';

class Weather_Data {
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key': '348f6a3f715e4bacac571608233001',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);

      final response = await http.get(uri);
      if (response.statusCode == 200) {


        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Unable to fetch weather data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
