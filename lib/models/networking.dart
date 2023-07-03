import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? weatherApiKey = dotenv.env['WEATHER_DATA_API_KEY'];

class Networking {}

class WeatherNetworking extends Networking {
  Future<dynamic> fetchWeather({required lat, required lon}) async {
    String weatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric';

    final response = await http.get(Uri.parse(weatherUrl));

    if (response.statusCode != 200) {
      throw Exception('Exception failed.');
    }

    return jsonDecode(response.body);
  }
}
