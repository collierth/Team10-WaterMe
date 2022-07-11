import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waterme/models/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7f0ed6355c55d43e31dcb33d1022070d&units=imperial");
  
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}