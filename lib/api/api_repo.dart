import 'package:dio/dio.dart';

import '../model/current_weather_model.dart';

class ApiRepo {
  final Dio _dio = Dio();
  String city;
  late CurrentWeatherModel currentWeatherData;

  ApiRepo({required this.city});

  String apiKey = "appid=fba9a046bb843b1ef46b771a066b687c";
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather?q=";
  late String url = "$baseUrl$city&$apiKey";

  Future<CurrentWeatherModel> getData() async {
    dynamic res =await _dio.get(url);
    return CurrentWeatherModel.fromJson(res.data);
  }
}
