import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService
{
  String baseUrl ='http://api.weatherapi.com/v1';
  String apikey = 'cf4047370314483eae794319242304';
  Future<WeatherModel> getWeather({required String cityName})async
  { 
    Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apikey&q=$cityName&days=7');
   http.Response response = await  http.get(url);
  if (response.statusCode == 400) {
    var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);  


    WeatherModel weather = WeatherModel.fromJson(data);
    
    return weather;
  }
}